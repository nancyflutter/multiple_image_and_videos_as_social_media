import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/socket_helper.dart';
import '../../../core/core.dart';

class BottomNavigationBarUI extends StatelessWidget {
  const BottomNavigationBarUI({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardScreenController>(
      init: DashboardScreenController(),
      builder: (controller) {
        return Scaffold(
          body: controller.tabWidgets[controller.currentIndex.value],
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: SizedBox(
              height: 60.sp,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: MyColors.white,
                currentIndex: controller.currentIndex.value,
                onTap: (i) => controller.changeNavigationTab(newIndex: i),
                selectedFontSize: 12.sp,
                selectedItemColor: MyColors.secondaryColor,
                unselectedFontSize: 12.sp,
                iconSize: 22.sp,
                unselectedItemColor: MyColors.appTxtColor,
                selectedLabelStyle: Theme.of(context).grayCliff500,
                unselectedLabelStyle: Theme.of(context).grayCliff500.copyWith(color: MyColors.appTxtColor),
                items: controller.tabBarItems
                    .map(
                      (e) => BottomNavigationBarItem(
                        backgroundColor: MyColors.white,
                        label: e.title ?? '',
                        icon: controller.tabBarItems.indexOf(e) == 1
                            ? Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.asset(
                                    e.icon ?? "",
                                    height: 22.sp,
                                    width: 22.sp,
                                    color: controller.tabBarItems.indexOf(e) == controller.currentIndex.value ? MyColors.secondaryColor : MyColors.appTxtColor,
                                  ),
                                  (controller.socketHelper?.allTotalUnReadMsg.value ?? 0) > 0
                                      ? Container(
                                          height: 15.sp,
                                          width: 15.sp,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(color: MyColors.red, borderRadius: BorderRadius.circular(100.sp)),
                                          child: Text(
                                            "${controller.socketHelper?.allTotalUnReadMsg.value}",
                                            style: Theme.of(context).grayCliff700.copyWith(fontSize: 8.sp, color: MyColors.white),
                                          ),
                                        )
                                      : SizedBox(height: 12.sp),
                                ],
                              )
                            : Image.asset(
                                e.icon ?? "",
                                height: 22.sp,
                                width: 22.sp,
                                color: controller.tabBarItems.indexOf(e) == controller.currentIndex.value ? MyColors.secondaryColor : MyColors.appTxtColor,
                              ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
