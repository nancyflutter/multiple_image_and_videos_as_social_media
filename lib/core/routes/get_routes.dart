import 'package:multiple_image_and_videos_as_social_media/module/chat/chat.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/screen/feed_supplier_profile_follower_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/screen/notification_post_detail_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/screen/notification_screen_user_activity.dart';
import 'package:multiple_image_and_videos_as_social_media/module/feed/screen/user_account_get_profile_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/screen/search_location_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/screen/track_order_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/screen/end_user_to_follow_following_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/screen/particular_user_comment_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/screen/perticular_user_post_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/screen/profile_post_detail_page.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/screen/tag_search_screen.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/screen/web_view_screen.dart';

class Routes {
  Routes._();

  static List<GetPage> get getPages => _pages;

  static final List<GetPage> _pages = [
    GetPage(name: RoutesStrings.splashRoute, page: () => const SplashScreen()),
    GetPage(name: RoutesStrings.loginRoute, page: () => LoginScreen()),
    GetPage(name: RoutesStrings.forgotPasswordRoute, page: () => const ForgotPassword(), transition: Transition.downToUp, transitionDuration: const Duration(milliseconds: 400)),
    GetPage(name: RoutesStrings.signUpRoute, page: () => SignupScreen()),
    GetPage(name: RoutesStrings.bottomNavigationRoute, page: () => const BottomNavigationBarUI()),
    GetPage(name: RoutesStrings.homeRoute, page: () => const HomeScreen()),
    GetPage(name: RoutesStrings.bookingDetailsRoute, page: () => const BookingHistoryDetailsScreen()),
    GetPage(name: RoutesStrings.bookingDetailsRoute, page: () => const BookingDetailsScreen()),
    GetPage(name: RoutesStrings.bookingServiceListRoute, page: () => BookingServiceListScreen()),
    GetPage(name: RoutesStrings.homeSubCategoriesRoute, page: () => const HomeSubCategoriesScreen()),
    GetPage(name: RoutesStrings.homeSubEatCategoriesRoute, page: () => const HomeSubEatCategoriesScreen()),
    GetPage(name: RoutesStrings.paymentRoute, page: () => const PaymentScreen()),
    GetPage(name: RoutesStrings.serviceBookingRoute, page: () => ServiceBookingScreen()),
    GetPage(name: RoutesStrings.serviceDetailsRoute, page: () => const ServiceDetailScreen()),
    GetPage(name: RoutesStrings.serviceDetailsEatRoute, page: () => const ServiceDetailEatScreen()),
    GetPage(name: RoutesStrings.bookingHistoryRoute, page: () => const BookingHistoryScreen()),
    GetPage(name: RoutesStrings.tagPeopleRoute, page: () => TagPeopleScreen()),
    GetPage(name: RoutesStrings.favouritesRoute, page: () => const FavouritesScreen()),
    GetPage(name: RoutesStrings.profileScreen, page: () => const ProfileScreen()),
    GetPage(name: RoutesStrings.editProfileRoute, page: () => const EditProfileScreen()),
    GetPage(name: RoutesStrings.followersFollowingRoute, page: () => const FollowersFollowingScreen()),
    GetPage(name: RoutesStrings.feedSupplierProfileFollowerScreenRoute, page: () => const FeedSupplierProfileFollowerScreen()),
    GetPage(name: RoutesStrings.settingRoute, page: () => const SettingScreen()),
    GetPage(name: RoutesStrings.newPostRoute, page: () => NewPostScreen()),
    GetPage(name: RoutesStrings.wanderCoinsRoute, page: () => const WanderCoinScreen()),
    GetPage(name: RoutesStrings.searchRoute, page: () => const SearchScreen()),
    GetPage(name: RoutesStrings.mapRoute, page: () => MapScreen()),
    GetPage(name: RoutesStrings.referAndEarnRoute, page: () => ReferAndEarnScreen()),
    GetPage(name: RoutesStrings.availablityRoute, page: () => const AvailabilityScreen()),
    GetPage(name: RoutesStrings.bookingEatInfoRoute, page: () => const BookingEatInfoScreen()),
    GetPage(name: RoutesStrings.bookingEatDetailsRoute, page: () => const BookingEatDetailScreen()),
    GetPage(name: RoutesStrings.eatTabFilterRoute, page: () =>  const HomeSubCategoriesFilterScreen()),
    // GetPage(name: RoutesStrings.changePasswordRoute, page: () => ChangePasswordScreen(),transition: Transition.downToUp, transitionDuration: const Duration(milliseconds: 400)),
    GetPage(name: RoutesStrings.chatRoute, page: () => const ChatScreen()),
    GetPage(name: RoutesStrings.feedRoute, page: () => const FeedScreen()),
    GetPage(name: RoutesStrings.commentRoute, page: () => const CommentScreen()),
    GetPage(name: RoutesStrings.particularUserCommentRoute, page: () => const ParticularUserCommentScreen()),
    GetPage(name: RoutesStrings.searchLocationRoute, page: () => const SearchLocationScreen()),
    GetPage(name: RoutesStrings.userActivityFeedNotificationRoute, page: () => const ActivityNotificationScreen()),
    GetPage(name: RoutesStrings.userAccountGetProfileRoute, page: () => const UserAccountGetProfileScreen()),
    GetPage(name: RoutesStrings.particularUserPostScreen, page: () => const ParticularUserPostScreen()),
    GetPage(name: RoutesStrings.trackOrderScreen, page: () => const TrackOrderScreen()),
    GetPage(name: RoutesStrings.profilePostDetailPageRoute, page: () => const ProfilePostDetailPage()),
    GetPage(name: RoutesStrings.tagSearchScreenRoute, page: () => const TagSearchScreen()),
    GetPage(name: RoutesStrings.notificationPostDetailScreen, page: () => const NotificationPostDetailScreen()),
    GetPage(name: RoutesStrings.bookingDetailsScreen, page: () => const BookingHistoryDetailsScreen()),
    GetPage(name: RoutesStrings.webConditionScreenRoute, page: () => const WebConditionScreen()),
    // GetPage(name: RoutesStrings.pDFViewerPageRoute, page: () => const PDFViewerPage(pdfUrl: '',)),
    GetPage(name: RoutesStrings.endUserToFollowFollowingScreen, page: () => const EndUserToFollowFollowingScreen()),
  ];
}
