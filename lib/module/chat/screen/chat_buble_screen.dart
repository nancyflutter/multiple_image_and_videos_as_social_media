import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../chat.dart';
import 'full_screen_image_view.dart';

class ChatBubble extends StatelessWidget {
  final int index;

  const ChatBubble({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ChatScreenController(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            margin: EdgeInsets.symmetric(vertical: 8.sp),
            alignment: controller.socketHelperController.messages[index].type == "u" ? Alignment.centerRight : Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: controller.socketHelperController.messages[index].type == "u" ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.socketHelperController.messages[index].type != "u")
                  Padding(
                    padding: EdgeInsets.only(right: 8..sp),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(ImageConstants.carousalImage4),
                    ),
                  ),
                SizedBox(
                  width: Get.width * 0.6,
                  child: Column(
                    crossAxisAlignment: controller.socketHelperController.messages[index].type == "u" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      controller.socketHelperController.messages[index].msgType == 't'
                          ? Container(
                              padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 14.sp),
                              decoration: BoxDecoration(
                                color: controller.socketHelperController.messages[index].type == "u" ? Colors.green[100] : Colors.white,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              child:
                                  //?
                                  Text(
                                controller.socketHelperController.messages[index].message ?? '',
                                style: Theme.of(context).grayCliff400.copyWith(fontSize: 16.sp, color: MyColors.appTxtColor),
                              ))
                          : GestureDetector(
                              onTap: () {
                                Get.to(
                                  FullScreenImageView(
                                    isSent: controller.socketHelperController.messages[index].isSent,
                                    image: controller.socketHelperController.messages[index].image ?? '',
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(6.sp),
                                constraints: controller.socketHelperController.messages[index].image != null
                                    ? BoxConstraints(
                                        maxHeight: 250.sp,
                                        minWidth: 200.sp,
                                        maxWidth: 230.sp,
                                      )
                                    : const BoxConstraints(),
                                decoration: BoxDecoration(
                                  color: controller.socketHelperController.messages[index].type == "u" ? Colors.green[100] : Colors.white,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  child: controller.socketHelperController.messages[index].isSent
                                      ? FadeInImage(
                                          placeholder: AssetImage(ImageConstants.placeholderImg),
                                          image: MemoryImage(
                                            base64Decode(controller.socketHelperController.messages[index].image ?? ''),
                                          ),
                                          fit: BoxFit.cover,
                                          width: 190.sp,
                                          imageErrorBuilder: (context, error, stackTrace) => const Icon(Icons.error_outline),
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: controller.socketHelperController.messages[index].image ?? '',
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) => const Center(
                                            child: Icon(Icons.error_outline),
                                          ),
                                          progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset(
                                            ImageConstants.placeholderImg,
                                            width: 190.sp,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                      8.sp.verticalSpace,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.socketHelperController.messages[index].isSent != true
                              ? Text(
                                  DateFormat('hh:mm a').format(
                                    controller.getTime(
                                      controller.socketHelperController.messages[index].createdAt.toString(),
                                    ),
                                  ),
                                  style: Theme.of(context).grayCliff400.copyWith(fontSize: 12.sp, color: MyColors.appTxtColor),
                                )
                              : Text(
                                  DateFormat('hh:mm a').format(DateTime.now()),
                                  style: Theme.of(context).grayCliff400.copyWith(fontSize: 12.sp, color: MyColors.appTxtColor),
                                ),
                          if (controller.socketHelperController.messages[index].type == "u")
                            Padding(
                              padding: EdgeInsets.only(left: 8.sp),
                              child: Image.asset(
                                ImageConstants.icDoubleTick,
                                width: 16,
                                height: 16,
                                color: controller.socketHelperController.messages[index].isRead == 1 ? MyColors.secondaryColor : MyColors.grey,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
