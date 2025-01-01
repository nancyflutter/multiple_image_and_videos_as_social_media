import 'package:carousel_slider/carousel_slider.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/common_rating_bar.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/expanded_html_to_text_widget.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/screen/pdf_load.dart';
import 'package:multiple_image_and_videos_as_social_media/module/home/screen/view_all_review_screen.dart';
import '../../../core/core.dart';

class ServiceDetailEatScreen extends StatelessWidget {
  const ServiceDetailEatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ServiceDetailsEatScreenController(),
      builder: (controller) {
        return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: controller.getRestaurantDetailData.value.id != null
                  ? NestedScrollView(
                      controller: controller.scrollController,
                      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: 270.sp,
                            pinned: true,
                            backgroundColor: MyColors.white,
                            elevation: 0.5,
                            leading: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: SizedBox(
                                height: 40.sp,
                                width: 40.sp,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius: BorderRadius.circular(4.sp),
                                  ),
                                  child: Image.asset(
                                    ImageConstants.iconBack,
                                    scale: 3,
                                  ).addGesture(
                                    () {
                                      if (controller.restaurantIdList.length > 1) {
                                        controller.manageNestedBackForSimilarRestaurant();
                                      } else {
                                        Get.back();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            actions: [
                              controller.showVerifiedOpen.value
                                  ? Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: MyColors.secondaryColor,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
                                          child: Text(
                                            "Verified Open",
                                            style: Theme.of(context).grayCliff500.copyWith(
                                                  fontSize: MyFonts.fonts16,
                                                  color: MyColors.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                            flexibleSpace: LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {
                                var top = constraints.biggest.height;
                                double opacity = (top - kToolbarHeight) / (250.0 - kToolbarHeight);
                                opacity = opacity.clamp(0.0, 1.0);
                                return FlexibleSpaceBar(
                                  centerTitle: true,
                                  title: Opacity(
                                    opacity: 1 - opacity,
                                    child: Text(
                                      controller.getRestaurantDetailData.value.attributes?.name ?? '',
                                      style: Theme.of(context).grayCliff600.copyWith(
                                            fontSize: 16.sp,
                                          ),
                                    ),
                                  ),
                                  background: controller.serviceImage.isNotEmpty
                                      ? Stack(
                                          fit: StackFit.expand,
                                          children: <Widget>[
                                            CarouselSlider(
                                              items: controller.serviceImage
                                                  .map((item) => CachedNetworkImage(
                                                        imageUrl: item,
                                                        fit: BoxFit.cover,
                                                        placeholder: (context, url) => Image.asset(
                                                          ImageConstants.placeholderImg,
                                                        ),
                                                        errorWidget: (context, url, error) => Image.asset(
                                                          ImageConstants.placeholderImg,
                                                        ),
                                                      ))
                                                  .toList(),
                                              options: CarouselOptions(
                                                viewportFraction: 1,
                                                autoPlay: true,
                                                aspectRatio: 1.0,
                                                onPageChanged: (index, reason) {
                                                  controller.currentIndex.value = index;
                                                  controller.update();
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: List.generate(
                                                    controller.serviceImage.length,
                                                    (index) => Container(
                                                      width: 9.sp,
                                                      height: 9.sp,
                                                      margin: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 7.sp),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: controller.currentIndex.value == index ? MyColors.secondaryColor : MyColors.secondaryColor.withOpacity(0.4),
                                                      ),
                                                    ),
                                                  ).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Image.asset(
                                          ImageConstants.placeholderImg,
                                          fit: BoxFit.cover,
                                        ),
                                );
                              },
                            ),
                          ),
                        ];
                      },
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              color: MyColors.white,
                              padding: EdgeInsets.all(12.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.getRestaurantDetailData.value.attributes?.name ?? '',
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                          ),
                                          const Spacer(),
                                          ...List.generate(
                                            controller.getRestaurantDetailData.value.attributes?.priceLevel ?? 0,
                                            (starIndex) => Text(
                                              '\$',
                                              style: Theme.of(context).grayCliff600,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.sp,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.addBookMarkAPI(id: controller.restaurantId.toString());
                                            },
                                            child: Image.asset(
                                              controller.getRestaurantDetailData.value.attributes?.isBookmark == 1 ? ImageConstants.iconFillBookmark : ImageConstants.iconBookmark,
                                              color: Colors.black,
                                              height: 25.sp,
                                              width: 25.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            ImageConstants.iconMapPinBlack,
                                            height: 20.sp,
                                            width: 20.sp,
                                          ),
                                          5.horizontalSpace,
                                          Expanded(
                                            child: Text(
                                              '${controller.getRestaurantDetailData.value.attributes?.addressLine1 ?? ''}${controller.getRestaurantDetailData.value.attributes?.addressLine2 ?? ''}${controller.getRestaurantDetailData.value.attributes?.city ?? ''}',
                                              style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts14),
                                              maxLines: 5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              controller.getRestaurantDetailData.value.attributes?.cuisine ?? '',
                                              style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                            ),
                                            SizedBox(width: 6.sp),
                                            if (controller.getRestaurantDetailData.value.attributes?.establishmentType != null)
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 2.sp),
                                                child: const Icon(
                                                  Icons.circle_rounded,
                                                  size: 5,
                                                ),
                                              ),
                                            SizedBox(width: 6.sp),
                                            if (controller.getRestaurantDetailData.value.attributes?.establishmentType != null)
                                              Text(
                                                controller.getRestaurantDetailData.value.attributes?.establishmentType ?? '',
                                                style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                              ),
                                            const Spacer(),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 3.sp),
                                              decoration: BoxDecoration(
                                                color: MyColors.black,
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: MyColors.white,
                                                    size: 15.sp,
                                                  ),
                                                  SizedBox(width: 3.sp),
                                                  Text(
                                                    controller.getRestaurantDetailData.value.attributes?.ratingsAverage ?? '0.0',
                                                    style: Theme.of(context).grayCliff600.copyWith(color: MyColors.white, fontSize: MyFonts.fonts14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // CommonRatingBar(
                                            //   onRatingUpdate: (rating) {},
                                            //   itemGap: 1.0.sp,
                                            //   initialRating: controller.getRestaurantDetailData.value.attributes?.ratingsAverage != null ? double.parse(controller.getRestaurantDetailData.value.attributes?.ratingsAverage.toString() ?? '') : 0.0,
                                            //   ignoreGestures: true,
                                            //   iconSize: 16.sp,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 8.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  /// Description
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Description",
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                          ),
                                          10.verticalSpace,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ExpandableHtmlWidget(
                                                htmlContent: controller.getRestaurantDetailData.value.attributes?.description ?? "",
                                                // collapsedHeight: 100.0,
                                                textStyle: const TextStyle(color: Colors.black),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// Covid description
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Covid-19 information",
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.red),
                                          ),
                                          10.verticalSpace,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Please be aware that the municipality of Abu Dhabi has issued restrictions for restaurants during the pandemic.",
                                                style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// From the restaurant
                                  controller.getRestaurantDetailData.value.attributes?.termsAndConditions != null
                                      ? Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.sp),
                                          ),
                                          elevation: 2.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(12.sp),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "From the restaurant",
                                                  style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.red),
                                                ),
                                                10.verticalSpace,
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller.getRestaurantDetailData.value.attributes?.termsAndConditions ?? "",
                                                      style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),

                                  /// Features
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Features",
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
                                          ),
                                          SizedBox(height: 10.sp),
                                          Wrap(
                                            spacing: 8.sp,
                                            runSpacing: 8.sp,
                                            children: List.generate(
                                              controller.showAll.value ? controller.featuresList.length : (controller.featuresList.length < 7 ? controller.featuresList.length : 7),
                                              (index) => Container(
                                                padding: EdgeInsets.all(6.sp),
                                                decoration: BoxDecoration(
                                                  color: MyColors.secondaryColor.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(6.sp),
                                                ),
                                                child: Text(
                                                  controller.featuresList[index],
                                                  style: Theme.of(context).grayCliff500.copyWith(
                                                        fontSize: 14.sp,
                                                        color: MyColors.secondaryColor,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.sp),
                                          if (controller.featuresList.length > 5)
                                            GestureDetector(
                                              onTap: () {
                                                controller.showAll.value = !controller.showAll.value;
                                              },
                                              child: Center(
                                                child: Text(
                                                  controller.showAll.value ? "View Less" : "View More",
                                                  style: TextStyle(
                                                    color: MyColors.secondaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// Opening Hours section
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    // margin: EdgeInsets.symmetric(horizontal: 8.0),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Opening Hours",
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                          ),
                                          18.verticalSpace,
                                          controller.operatingHours.isNotEmpty
                                              ? ListView.builder(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  itemCount: 7,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(bottom: 12.sp),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            controller.dayList[index],
                                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14),
                                                          ),
                                                          Text(
                                                            controller.operatingHours[index],
                                                            style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Center(
                                                  child: Text(
                                                    "No Data Found",
                                                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// For menu
                                  controller.getRestaurantDetailData.value.attributes?.menuUrl != null
                                      ? GestureDetector(
                                          onTap: () async {
                                            // if (!await launchUrl(
                                            //   Uri.parse(controller.getRestaurantDetailData.value.attributes?.menuUrl ?? ''),
                                            // )) {
                                            //   throw Exception('Could not launch ${Uri.parse(controller.getRestaurantDetailData.value.attributes?.menuUrl ?? '')}');
                                            // }

                                            print("~~~~~~~~~~~~~~~~~~~~~~~ok~~~~~~~~~~~~~~~~~~~~~~~~");
                                            Get.to(() => PDFViewerPage(
                                                  name: "${controller.getRestaurantDetailData.value.attributes?.name}",
                                                  pdfUrl: controller.getRestaurantDetailData.value.attributes?.menuUrl ?? "",
                                                ));

                                            // Get.toNamed(
                                            //   RoutesStrings.webConditionScreenRoute,
                                            //   arguments: {
                                            //     "url": controller.getRestaurantDetailData.value.attributes?.menuUrl ?? "",
                                            //     "Name": controller.getRestaurantDetailData.value.attributes?.name,
                                            //   },
                                            // );
                                            // print("==========menuUrl=================== ${controller.getRestaurantDetailData.value.attributes?.menuUrl}");
                                            // print("=========name==================== ${controller.getRestaurantDetailData.value.attributes?.name}");
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.sp),
                                            ),
                                            elevation: 2.0,
                                            child: Padding(
                                              padding: EdgeInsets.all(12.sp),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "Restaurant Menu",
                                                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                                  ),
                                                  const Spacer(),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: MyColors.secondaryColor,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),

                                  /// Location section
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Location',
                                            style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                          ),
                                          const SizedBox(height: 10.0),
                                          SizedBox(
                                            height: 200.0,
                                            child: GoogleMap(
                                              onMapCreated: controller.onMapCreated,
                                              initialCameraPosition: CameraPosition(
                                                target: controller.serviceLocationLatLng.value,
                                                zoom: 11.0,
                                              ),
                                              markers: Set<Marker>.of(controller.markers),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Reviews',
                                              style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(const ViewAllReviewScreen());
                                              },
                                              child: Text(
                                                'View All',
                                                style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.secondaryColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.sp),
                                        ),
                                        elevation: 2.0,
                                        child: Padding(
                                          padding: EdgeInsets.all(12.sp),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                height: 50.sp,
                                                decoration: const BoxDecoration(shape: BoxShape.circle),
                                                child: Image.asset(
                                                  ImageConstants.icUserPlaceholder,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              10.horizontalSpace,
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              'Mitesh',
                                                              style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16),
                                                            ),
                                                            CommonRatingBar(
                                                              onRatingUpdate: (rating) {},
                                                              itemGap: 1.5.sp,
                                                              initialRating: 4.5,
                                                              //rating != "" ? double.parse(rating) : 0.0,
                                                              ignoreGestures: true,
                                                              iconSize: 16.sp,
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          'Sept 14, 2019',
                                                          style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16),
                                                        ),
                                                      ],
                                                    ),
                                                    10.verticalSpace,
                                                    Text(
                                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                                                      style: Theme.of(context).grayCliff400.copyWith(fontSize: MyFonts.fonts16),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  12.verticalSpace,
                                  Text(
                                    ' Similar Restaurant',
                                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
                                  ),
                                ],
                              ),
                            ),
                            controller.similarRestaurantData.isNotEmpty
                                ? SizedBox(
                                    height: 340.sp,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      controller: controller.similarResScrollController.value,
                                      shrinkWrap: true,
                                      itemCount: controller.isNextPage.value ? controller.similarRestaurantData.length + 1 : controller.similarRestaurantData.length,
                                      itemBuilder: (context, index) {
                                        if (index == controller.similarRestaurantData.length) {
                                          return SizedBox(
                                            width: 100.sp,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: MyColors.secondaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        return Padding(
                                          padding: EdgeInsets.only(right: index == controller.similarRestaurantData.length - 1 ? 6.sp : 0, left: index == 0 ? 6 : 0),
                                          child: controller.similarRestaurantData[index].attributes?.name == controller.getRestaurantDetailData.value.attributes?.name
                                              ? const SizedBox()
                                              : GestureDetector(
                                                  onTap: () {
                                                    controller.manageNestedGoToSimilarRestaurant(index);
                                                  },
                                                  behavior: HitTestBehavior.opaque,
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width * 0.9,
                                                    margin: EdgeInsets.all(3.sp),
                                                    child: Card(
                                                      color: MyColors.white,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(6.sp),
                                                      ),
                                                      elevation: 2.0,
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.all(12.sp),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      controller.similarRestaurantData[index].attributes?.name ?? '',
                                                                      style: Theme.of(context).grayCliff600,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        ...List.generate(
                                                                          controller.similarRestaurantData[index].attributes?.priceLevel ?? 0,
                                                                          (starIndex) => Text(
                                                                            '\$',
                                                                            style: Theme.of(context).grayCliff600,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                5.verticalSpace,
                                                                Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Image.asset(
                                                                      ImageConstants.iconMapPinBlack,
                                                                      color: MyColors.grey,
                                                                      height: 20.sp,
                                                                      width: 20.sp,
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                        maxLines: 2,
                                                                        '${controller.similarRestaurantData[index].attributes?.addressLine1},${controller.similarRestaurantData[index].attributes?.addressLine2},${controller.similarRestaurantData[index].attributes?.city}',
                                                                        style: Theme.of(context).grayCliff500.copyWith(color: MyColors.grey, fontSize: MyFonts.fonts14),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 3.sp),
                                                                      decoration: BoxDecoration(
                                                                        color: MyColors.black,
                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                      ),
                                                                      child: Row(
                                                                        children: [
                                                                          Image.asset(
                                                                            ImageConstants.iconStarBlack,
                                                                            color: MyColors.white,
                                                                            height: 15.sp,
                                                                            width: 15.sp,
                                                                          ),
                                                                          3.horizontalSpace,
                                                                          Text(
                                                                            controller.similarRestaurantData[index].attributes?.ratingsAverage ?? '',
                                                                            style: Theme.of(context).grayCliff300.copyWith(
                                                                                  color: MyColors.white,
                                                                                  fontSize: MyFonts.fonts14,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(height: 2.sp, color: MyColors.dividerColor),
                                                          Container(
                                                            height: 230.sp,
                                                            width: double.infinity, // Ensure the image takes the full width
                                                            padding: EdgeInsets.all(12.sp),
                                                            child: Card(
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(6.sp),
                                                              ),
                                                              elevation: 2,
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(6.sp),
                                                                child: controller.similarRestaurantData[index].attributes?.imageUrl != null && controller.similarRestaurantData[index].attributes?.imageUrl != ''
                                                                    ? CachedNetworkImage(
                                                                        imageUrl: controller.similarRestaurantData[index].attributes?.imageUrl ?? '',
                                                                        fit: BoxFit.cover,
                                                                        placeholder: (context, url) => Image.asset(
                                                                          ImageConstants.placeholderImg,
                                                                        ),
                                                                        errorWidget: (context, url, error) => Image.asset(
                                                                          ImageConstants.placeholderImg,
                                                                        ),
                                                                      )
                                                                    : Image.asset(
                                                                        ImageConstants.placeholderImg,
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        );
                                      },
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: MyColors.secondaryColor,
                                    ),
                                  ),
                            85.verticalSpace,
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),

              /// Search Availability
              bottomSheet: controller.getRestaurantDetailData.value.id != null
                  ? GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesStrings.availablityRoute, arguments: controller.passRestaurantDetail.value);
                      },
                      child: Container(
                        height: 50.sp,
                        color: MyColors.secondaryColor,
                        padding: EdgeInsets.symmetric(vertical: 15.sp),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Search Availability',
                          style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts16, color: MyColors.white),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ));
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: MyColors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
