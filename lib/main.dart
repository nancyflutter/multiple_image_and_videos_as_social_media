import 'package:flutter/services.dart';
import 'package:multiple_image_and_videos_as_social_media/services/service.dart';

void main() {
  AppInitialize.initApp().then((init) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyColors.white,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    runApp(const MyApp().dismissKeyboard());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: MyColors.white,
    //   systemNavigationBarColor: Colors.black,
    //   systemNavigationBarIconBrightness: Brightness.light,
    // ));
    return ScreenUtilInit(
      designSize: const Size(NEW_VALUE_FIGMA_DESIGN_WIDTH, NEW_VALUE_FIGMA_DESIGN_HEIGHT),
      child: GetMaterialApp(
        title: 'Wander Consumer',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: AppTheme.lightTheme,
        initialRoute: RoutesStrings.splashRoute,
        getPages: Routes.getPages,
        scrollBehavior: AppScrollBehavior(),
        initialBinding: RootBinding(releaseMode: ReleaseMode.local),
      ),
    );
  }
}

class AppScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
