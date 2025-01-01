import 'dart:convert';
import '../../../core/core.dart';

class FullScreenImageView extends StatelessWidget {
  final bool isSent;
  final String image;
  const FullScreenImageView({super.key, required this.isSent, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      appBar: AppBar(
        backgroundColor: MyColors.black,
        elevation: 0.5,
        centerTitle: true,
        leading: Image.asset(
          scale: 3,
          ImageConstants.iconBack,
          color: MyColors.white,
        ).addGesture(
          () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.sp),
            child: isSent
                ? FadeInImage(
                    placeholder: AssetImage(ImageConstants.placeholderImg),
                    image: MemoryImage(
                      base64Decode(image),
                    ),
                    fit: BoxFit.cover,
                    height: Get.height,
                    width: Get.width,
                    imageErrorBuilder: (context, error, stackTrace) => const Icon(Icons.error_outline),
                  )
                : CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    // height: Get.height,
                    // width: Get.width,
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error_outline),
                    ),
                    progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset(
                      ImageConstants.placeholderImg,
                      //width: 190.sp,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
