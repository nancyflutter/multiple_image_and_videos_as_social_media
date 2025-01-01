/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../booking/booking.dart';
import '../../home/home.dart';
import '../../profile/profile.dart';

class BottomNavigationScreenController extends GetxController {

  RxInt pageIndex = RxInt(0);
  RxList<Widget> views = RxList([
    HomeScreen(),
    BookingHistoryScreen(),
    ProfileScreen(),
    HomeScreen(),
  ]);

  @override
  void onInit() {
    pageIndex.value = 0;
    super.onInit();
  }
}
*/

import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/socket_helper.dart';
import '../../../core/core.dart';

class DashboardScreenController extends GetxController {
  RxInt currentIndex = RxInt(0);
  final appController = Get.find<AppController>();
  SocketHelper? socketHelper;
  List<Widget> tabWidgets = [
    const HomeScreen(),
    const BookingHistoryScreen(),
    const ProfileScreen(),
    const FeedScreen(),
  ];

  Widget get selectedTabWidgets {
    return tabWidgets[currentIndex.value];
  }

  List<BottomNavigationItemModel> tabBarItems = [
    BottomNavigationItemModel(
      icon: ImageConstants.iconHomeHover,
      title: "Home",
      selectedColor: MyColors.secondaryColor,
    ),
    BottomNavigationItemModel(
      icon: ImageConstants.icFillBookings,
      title: 'Bookings',
      selectedColor: MyColors.secondaryColor,
    ),
    BottomNavigationItemModel(
      icon: ImageConstants.icProfile,
      title: 'Profile',
      selectedColor: MyColors.secondaryColor,
    ),
    BottomNavigationItemModel(
      icon: ImageConstants.iconFeed,
      title: 'Feed',
      selectedColor: MyColors.secondaryColor,
    ),
  ];

  void changeNavigationTab({required int newIndex}) {
    currentIndex.value = newIndex;
  }

  void goToProfile() {
    currentIndex.value = 2;
    Get.offAll(() => const BottomNavigationBarUI());
    update();
  }

  void goToHome() {
    currentIndex.value = 0;
    Get.offAll(() => const BottomNavigationBarUI());
   // Get.offNamedUntil(RoutesStrings.bottomNavigationRoute,  (route) => route.settings.name == '/login',);
    update();
  }

  @override
  void onInit() {
    Get.put<SocketHelper>(SocketHelper());
    socketHelper = Get.find<SocketHelper>();
    super.onInit();
  }
}
