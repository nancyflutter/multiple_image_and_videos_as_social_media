import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/socket_helper.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/extension/date_extention.dart';
import 'package:multiple_image_and_videos_as_social_media/module/chat/model/get_chat_history_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/chat/model/send_message_emit_model.dart';
import '../chat.dart';

class ChatScreenController extends GetxController {
  Rx<SendMessageEmitModel> sendMessageEmitData = Rx(SendMessageEmitModel());
  final socketHelperController = Get.find<SocketHelper>();

  Rx<TextEditingController> sendMessageController = Rx(TextEditingController());
  RxBool isChatLoading = RxBool(false);

  ///RxBool isNextPage = RxBool(false);

  @override
  void onInit() {
    sendMessageEmitData.value = Get.arguments;
    socketHelperController.toBookingId.value = sendMessageEmitData.value.bookId ?? '';
    socketHelperController.messages.clear();
    super.onInit();
  }

  getMessageEmit() {
    print("Current page ::::::::: ${socketHelperController.currentPage.value}");
    socketHelperController.socketGetMessage(
      getMessageData: SendMessageEmitModel(
        bookId: sendMessageEmitData.value.bookId,
        serviceId: sendMessageEmitData.value.serviceId,
        userId: sendMessageEmitData.value.userId,
        from: "u",
        to: "s",
        page: socketHelperController.currentPage.value,
      ),
    );
    socketHelperController.isMessagesLoading.value = true;
  }

  readMessageEmit() {
    socketHelperController.socketReadMessage(
      readMessageData: SendMessageEmitModel(
        bookId: sendMessageEmitData.value.bookId,
        serviceId: sendMessageEmitData.value.serviceId,
        userId: sendMessageEmitData.value.userId,
        from: "u",
        to: "s",
      ),
    );
  }

  String getDate(DateTime? date) {
    if (date == null) return "";
    return "${date.year}/${date.month}/${date.day}";
  }

  String dateFormat(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (date.isSameDay(today)) {
      return 'Today';
    } else if (date.isSameDay(yesterday)) {
      return 'Yesterday';
    } else {
      return DateFormat('dd MMMM, yyyy').format(date);
    }
  }

  DateTime getTime(String chatDateTime) {
    var dateTime = chatDateTime.split(" ");
    String utcTimeString = '${dateTime[0]}T${dateTime[1]}Z';
    DateTime utcDateTime = DateTime.parse(utcTimeString);
    DateTime localDateTime = utcDateTime.toLocal();
    return localDateTime;
  }

  void scrollToBottom() {
    socketHelperController.chatScrollController.value.jumpTo(
      socketHelperController.chatScrollController.value.position.minScrollExtent,
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final encodedImage = base64Encode(bytes);
      socketHelperController.socketSendMessage(
        sendMessageData: SendMessageEmitModel(
          bookId: sendMessageEmitData.value.bookId,
          serviceId: sendMessageEmitData.value.serviceId,
          userName: sendMessageEmitData.value.userName,
          userId: sendMessageEmitData.value.userId,
          img: encodedImage,
          from: "u",
          to: "s",
          type: "f",
        ),
      );
      socketHelperController.messages.insert(
        0,
        ChatListElement(
          image: encodedImage,
          createdAt: DateTime.now(),
          type: "u",
          isSent: true,
          msgType: "f",
        ),
      );
      socketHelperController.messages.refresh();
      scrollToBottom();
    }
  }
}
