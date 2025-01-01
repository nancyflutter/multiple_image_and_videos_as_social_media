import '../../../core/core.dart';

class TagPeopleScreen extends StatelessWidget {
  const TagPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: TagPeopleScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Tag people",
              style: Theme.of(context).grayCliff600.copyWith(
                fontSize: 16.sp,
              ),
            ),
            leading: Image.asset(
              scale: 3,
              ImageConstants.iconBack,
            ).addGesture(
                  () {
                Get.back();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 45.sp,
                  child:TextFormField(
                    controller: controller.servicePeopleController.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyColors.materialScaffoldBackground,
                      errorStyle: TextStyle(
                        fontSize: 0.sp,
                        color: MyColors.transparent,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0.sp),
                      hintText: "Tag your service provider...",
                      hintStyle:
                      Theme.of(context).grayCliff400.copyWith(color: MyColors.hintColor),
                      border: CommonProps.textFieldWhiteBorder,
                      disabledBorder: CommonProps.textFieldWhiteBorder,
                      enabledBorder: CommonProps.textFieldWhiteBorder,
                      errorBorder: CommonProps.textFieldWhiteBorder,
                      focusedBorder: CommonProps.textFieldWhiteBorder,
                      focusedErrorBorder: CommonProps.textFieldWhiteBorder,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Image.asset(ImageConstants.iconSearchGray,height: 20.sp,width: 20.sp,),
                      ),
                    ),
                    cursorColor: MyColors.secondaryColor,
                    style: Theme.of(context).grayCliff400.copyWith(color: MyColors.black),
                  )
                ),
                15.verticalSpace,
                GestureDetector(
                  onTap: () => Get.toNamed(RoutesStrings.newPostRoute),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25.sp,
                        // backgroundColor: Colors.grey.withOpacity(0.5), // Optional background color
                        child: ClipOval(
                          child: Image.asset(
                            ImageConstants.carousalImage1,
                            height: 60.sp,
                            width: 60.sp,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Text(
                          "Lamborghini Car Service",
                          style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
