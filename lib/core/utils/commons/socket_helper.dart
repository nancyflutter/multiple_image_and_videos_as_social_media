import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:multiple_image_and_videos_as_social_media/module/chat/chat.dart';
import 'package:multiple_image_and_videos_as_social_media/module/chat/model/get_chat_history_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/chat/model/send_message_emit_model.dart';

import '../../../app_controller/app_controller.dart';

class SocketHelper extends GetxController {
  final appController = Get.find<AppController>();
  Rx<GetChatHistoryResponse> chatHistoryData = Rx(GetChatHistoryResponse());
  Rx<ScrollController> chatScrollController = Rx(ScrollController());
  RxList<ChatListElement> messages = RxList([]);
  RxBool isFromPagination = RxBool(false);
  RxInt currentPage = RxInt(0);
  RxInt allTotalUnReadMsg = RxInt(0);
  RxString readBy = RxString('');
  RxBool isChatLoading = RxBool(false);
  RxBool isMessagesLoading = RxBool(false);
  RxString socketId = RxString('');
  RxString toBookingId = RxString('');
  late Socket socket;
  // static final Socket socket = io(
  //   'http://178.62.125.124:3205/',
  //   OptionBuilder().setTransports(['websocket']).build(),
  // );

  connectSocket({required String userId}) {
    if (socketId.value == "") {
      socket = IO.io('http://178.62.125.124:3205/', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false
      });
      socket.connect();
      socket.onConnect((_) async {
        Console.debug('Connection established');
        socketId.value = socket.id!;
        socketJoinUser(userId: userId);
      });
      socket.onDisconnect((_) async {
        Console.debug('Connection Disconnection');
      });
      socket.onConnectError((err) => Console.debug("error $err"));
      socket.onError((err) => Console.debug(err));

      getHistory();
      totalMsgCount();
      getReceivedMessages();
      getReadMessageSuccess();
      allMsgCount();
      orderMessageCount();
    }
    // if (!socket.connected) {
    //   socket.connect();
    //   socket.onConnect((data) {
    //     log('Socket Connection Successfully');
    //     socketJoinUser(userId: userId);
    //   });
    // } else {
    //   log('Socket Connection failed');
    // }
    //
    // socket.onConnectError((data) => print("Connect Error: $data"));
    // socket.onDisconnect((data) => print("Socket Disconnected"));
    // getHistory();
    // getReceivedMessages();
    // getReadMessageSuccess();
    // allMsgCount();
    // orderMessageCount();
  }

  onDisconnectSocket() {
    socket.disconnect();
    log('Socket is disconnected');
  }

  // Emit with a string payload
  onEmit(String strType, String strSendRequest) {
    print("onEmitString:::::::::::$strType $strSendRequest");
    socket.emit(strType, strSendRequest);
  }

  onEmitWithObject(String strType, dynamic objectSendRequest) {
    print("onEmitObject::::::::::$strType $objectSendRequest");
    socket.emit(strType, objectSendRequest);
  }

  ///app socket method
  socketJoinUser({required String userId}) {
    onEmit('join', 'u_$userId');
    print("join user ::::::: $userId");
  }

  socketRemoveUser({required String userId}) {
    onEmit('remove_user', 'u_$userId');
    print("remove_user ::::::: $userId");
  }

  socketSendMessage({required SendMessageEmitModel sendMessageData}) {
    onEmitWithObject('send_message', sendMessageData.toMap());
    print("socketSendMessageEmit::::::::::${sendMessageData.toJson()}");
  }

  getReceivedMessages() {
    socket.on("success", (data) {
      print("getReceivedMessages:::::::::::$data}");
      print("getReceivedMessagesdataatatat:::::::::::${data['message']}");
      messages.insert(
        0,
        ChatListElement(
          message: data['message'],
          type: data['from'],
          image: data['img_pre_url'] + data['message'],
          createdAt: DateTime.parse(data['created_at']),
          msgType: data['type'],
        ),
      );
      messages.refresh();
      // chatScrollController.value.jumpTo(chatScrollController.value.position.minScrollExtent);
      if (Get.isRegistered<ChatScreenController>()) {
        Get.find<ChatScreenController>().readMessageEmit();
      }
    });
  }

  socketGetMessage({required SendMessageEmitModel getMessageData}) {
    onEmitWithObject('get_message', getMessageData.toMap());
    print("socketGetMessageEmit::::::::::${getMessageData.toJson()}");
  }

  getHistory() {
    socket.on("history", (data) {
      log("getHistory :::::::::::$data}");
      if (data != null) {
        chatHistoryData.value = GetChatHistoryResponse.fromJson(data);
        if (chatHistoryData.value.list != null && (chatHistoryData.value.list?.isNotEmpty ?? false)) {
          for (int i = 0; i < (chatHistoryData.value.list?.length ?? 0); i++) {
            messages.add(ChatListElement(
                message: chatHistoryData.value.list?[i].message,
                type: chatHistoryData.value.list?[i].type,
                image: '${chatHistoryData.value.imgPreUrl}${chatHistoryData.value.list?[i].image}',
                createdAt: chatHistoryData.value.list?[i].createdAt,
                isRead: chatHistoryData.value.list?[i].isRead,
                msgType: chatHistoryData.value.list?[i].msgType));
          }
          currentPage.value++;
          isMessagesLoading.value = false;
        } else {
          isMessagesLoading.value = false;
        }
        for (var e in messages) {
          e.toMap();
          log("chat messages :::::::::::::${e.toMap()}");
        }
      }
    });
  }

  socketReadMessage({required SendMessageEmitModel readMessageData}) {
    onEmitWithObject("read_message", readMessageData.toMap());
    print("socketReadMessageEmit::::::::::${readMessageData.toJson()}");
  }

  getReadMessageSuccess() {
    socket.on("read_message_success", (data) {
      print("getReadMessageSuccess :::::::::::$data}");
      messages.map((element) => element.isRead = 1).toList();
      messages.refresh();
    });
  }

  allMsgCount() {
    socket.on("all_message_count", (data) {
      print("allMsgCount :::::::::::$data}");
      allTotalUnReadMsg.value = data['count'];
    });
  }

  orderMessageCount() {
    socket.on("order_message_count", (data) {
      print("orderMessageCount :::::::::::$data}");
    });
  }

  totalMsgCount() {
    socket.on("message_count", (data) {
      print("message_count :::::::::::$data}");
    });
  }


  @override
  void onInit() {
    connectSocket(userId: appController.loginResponse.value.userId.toString());
    super.onInit();
  }
}
