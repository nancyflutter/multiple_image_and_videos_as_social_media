import 'package:image_picker/image_picker.dart';
import 'package:multiple_image_and_videos_as_social_media/module/chat/model/get_chat_history_response.dart';
import 'package:multiple_image_and_videos_as_social_media/module/chat/model/send_message_emit_model.dart';
import '../chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ChatScreenController>(
        init: ChatScreenController(),
        initState: (cnt) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            cnt.controller?.socketHelperController.currentPage.value = 0;
            cnt.controller?.scrollToBottom();
            cnt.controller?.getMessageEmit();
            cnt.controller?.readMessageEmit();
            cnt.controller?.socketHelperController.chatScrollController.value.addListener(() {
              if (cnt.controller?.socketHelperController.chatScrollController.value.position.pixels == cnt.controller?.socketHelperController.chatScrollController.value.position.maxScrollExtent) {
                if ((cnt.controller?.socketHelperController.messages.isNotEmpty ?? false) && cnt.controller?.socketHelperController.currentPage.value != 0) {
                  cnt.controller?.getMessageEmit();
                }
              }
            });
          });
        },
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColors.white,
              elevation: 0.5,
              centerTitle: true,
              title: Text(
                controller.sendMessageEmitData.value.userName ?? '',
                style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
              ),
              leading: GestureDetector(
                  onTap: () {
                    Get.back(result: true);
                  },
                  child: Icon(Icons.arrow_back_ios, color: MyColors.appTxtColor)),
            ),
            body:
                //controller.isChatLoading.value ? Center(child: CircularProgressIndicator(color: MyColors.secondaryColor)) : const SizedBox.shrink(),
                // controller.socketHelperController.messages.isNotEmpty
                //     ?
                Column(
              children: [
                // controller.socketHelperController.isMessagesLoading.value
                //     ? Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Center(
                //           child: CircularProgressIndicator(color: MyColors.secondaryColor),
                //         ),
                //       )
                //     : const SizedBox.shrink(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: controller.socketHelperController.messages.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: controller.socketHelperController.chatScrollController.value,
                    padding: EdgeInsets.only(bottom: 100.sp),
                    itemBuilder: (context, index) {
                      final data = controller.socketHelperController.messages[index];
                      return Column(
                        children: [
                          if (index != (controller.socketHelperController.messages.length) - 1) ...[
                            if (controller.getDate(data.createdAt) != controller.getDate(controller.socketHelperController.messages[index + 1].createdAt))
                              Text(
                                controller.dateFormat(DateTime.parse(data.createdAt.toString()).toLocal()),
                                style: Theme.of(context).grayCliff500.copyWith(fontSize: 16.sp),
                              ).paddingSymmetric(vertical: 10.sp)
                            else
                              const SizedBox.shrink(),
                          ] else
                            Text(
                              controller.dateFormat(
                                DateTime.parse(data.createdAt.toString()).toLocal(),
                              ),
                              style: Theme.of(context).grayCliff500.copyWith(fontSize: 16.sp),
                            ).paddingSymmetric(vertical: 10.sp),
                          ChatBubble(
                            index: index,
                          ),
                          SizedBox(height: 10.h),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            // : const SizedBox.shrink(),
            bottomSheet: Container(
              height: 96.sp,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10.sp),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.sendMessageController.value,
                      decoration: InputDecoration(
                        hintText: 'Write your message..',
                        filled: true,
                        fillColor: MyColors.materialScaffoldBackground,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
                        prefixIcon: GestureDetector(
                          onTap: () async {
                            await selectImagePopUp(context: context, controller: controller);
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Image.asset(
                            ImageConstants.icCamera,
                            color: MyColors.greenBorderColor,
                            height: 16.sp,
                            width: 16.sp,
                            scale: 2.3,
                          ),
                        ),
                        border: CommonProps.textFieldWhiteBorder,
                        disabledBorder: CommonProps.textFieldWhiteBorder,
                        enabledBorder: CommonProps.textFieldWhiteBorder,
                        errorBorder: CommonProps.textFieldWhiteBorder,
                        focusedBorder: CommonProps.textFieldWhiteBorder,
                        focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  GestureDetector(
                    child: Image.asset(ImageConstants.icSend, height: 52.sp, width: 52.sp, fit: BoxFit.cover),
                    onTap: () {
                      if (controller.sendMessageController.value.text.isNotEmpty) {
                        print("object::::::::::debug is here");
                        controller.socketHelperController.socketSendMessage(
                          sendMessageData: SendMessageEmitModel(
                            bookId: controller.sendMessageEmitData.value.bookId,
                            serviceId: controller.sendMessageEmitData.value.serviceId,
                            userName: controller.sendMessageEmitData.value.userName,
                            userId: controller.sendMessageEmitData.value.userId,
                            message: controller.sendMessageController.value.text,
                            from: "u",
                            to: "s",
                            type: "t",
                          ),
                        );
                        controller.socketHelperController.messages.insert(
                          0,
                          ChatListElement(
                            message: controller.sendMessageController.value.text,
                            createdAt: DateTime.now(),
                            type: "u",
                            isSent: true,
                            msgType: "t",
                          ),
                        );
                        controller.socketHelperController.messages.refresh();
                        controller.scrollToBottom();
                        controller.sendMessageController.value.clear();
                      }
                    },
                  ),
                  8.sp.horizontalSpace
                ],
              ),
            ),
          );
        });
  }

  Future selectImagePopUp({required BuildContext context, required ChatScreenController controller}) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp))),
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(14.sp),
          decoration: BoxDecoration(color: MyColors.white, borderRadius: BorderRadius.circular(20.sp)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text('Camera'),
                      onTap: () async {
                        // await [Permission.camera, Permission.storage,Permission.photos].request();
                        controller.pickImage(ImageSource.camera).then((result) {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.photo),
                      title: const Text('Gallery'),
                      onTap: () async {
                        // await [Permission.camera, Permission.storage,Permission.photos].request();
                        controller.pickImage(ImageSource.gallery).then((result) {
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
                  child: Container(
                    height: 36.sp,
                    width: 36.sp,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
                    child: const Icon(Icons.clear, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
