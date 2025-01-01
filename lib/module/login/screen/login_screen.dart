import '../../../core/core.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final ValueNotifier<bool> passwordVisibility = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetX<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                125.verticalSpace,
                Center(
                  child: Image.asset(ImageConstants.splashLogo, height: 80.sp),
                ),
                28.verticalSpace,
                Form(
                  child: Column(
                    children: [
                      CommonTextField(
                        labelText: "Email",
                        controller: controller.emailController.value,
                      ),
                      18.verticalSpace,
                      ValueListenableBuilder(
                        valueListenable: passwordVisibility,
                        builder: (context, val, _) {
                          return CommonTextField(
                            labelText: "Password",
                            controller: controller.passwordController.value,
                            obscureText: val,
                            suffix: GestureDetector(
                              onTap: () {
                                passwordVisibility.value = !val;
                              },
                              child: Icon(
                                val ? Icons.visibility_off : Icons.visibility,
                                color: MyColors.hintColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                40.verticalSpace,
                CommonButton(
                  onTap: () {
                    controller.onLogin();
                  },
                  buttonText: "Log in",
                ),
                16.verticalSpace,
                Text(
                  "Forgot password?",
                  style: Theme.of(context).grayCliff700.copyWith(color: MyColors.appTxtColor, fontSize: MyFonts.fonts16),
                ).addGesture(
                  () => Get.toNamed(RoutesStrings.forgotPasswordRoute),
                ),
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90.sp,
                      height: 2.sp,
                      color: MyColors.dividerColor,
                    ),
                    Text(" Or log in with ", style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16)),
                    Container(
                      width: 90.sp,
                      height: 2.sp,
                      color: MyColors.dividerColor,
                    ),
                  ],
                ),
                25.verticalSpace,
                GestureDetector(
                  onTap: () {
                    // apiService.getCategoryApi();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.sp),
                    child: Container(
                        width: double.infinity,
                        height: 58.sp,
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(border: Border.all(color: MyColors.googleBorder)),
                        // color: MyColors.secondaryColor,
                        child: Image.asset(ImageConstants.iconGoogle)),
                  ),
                ),
                40.verticalSpace,
                Text(
                  "Dont't have an account?",
                  style: Theme.of(context).grayCliff600.copyWith(color: MyColors.appTxtColor, fontSize: MyFonts.fonts16),
                ),
                10.verticalSpace,
                Text(
                  "Sign Up",
                  style: Theme.of(context).grayCliff500.copyWith(color: MyColors.secondaryColor, fontSize: MyFonts.fonts16),
                ).addGesture(
                  () => Get.toNamed(RoutesStrings.signUpRoute),
                ),
              ],
            ).paddingSymmetric(horizontal: 16.sp),
          );
        },
      ),
    );
  }
}
