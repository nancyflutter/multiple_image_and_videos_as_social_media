import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiple_image_and_videos_as_social_media/core/core.dart';

class HomeSubCategoriesFilterScreen extends StatelessWidget {
  const HomeSubCategoriesFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeSubCategoriesScreenController>(
      init: HomeSubCategoriesScreenController(),
      initState: (cnt) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          cnt.controller?.getCuiSineCategoriesAPI();
        });
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Availability",
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
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              buildFilterSection(
                title: "Cuisines",
                options: controller.cuisine,
                showMore: controller.showMoreCuisines.value,
                controller: const HomeSubCategoriesFilterScreen(),
                context: context,
                toggleShowMore: () {
                  controller.showMoreCuisines.value = !controller.showMoreCuisines.value;
                  print("controller.showMoreCuisines.value ::::: ${controller.showMoreCuisines.value}");
                },
              ),
              buildFilterSection(
                title: "Labels",
                options: controller.label,
                showMore: controller.showMoreLabels.value,
                controller: const HomeSubCategoriesFilterScreen(),
                context: context,
                toggleShowMore: () {
                  controller.showMoreLabels.value = !controller.showMoreLabels.value;
                },
              ),
              buildFilterSection(
                title: "Food Types",
                options: controller.foodTypes,
                showMore: false,
                controller: const HomeSubCategoriesFilterScreen(),
                context: context,
                toggleShowMore: () {},
              ),
              buildFilterSection(
                title: "Prices",
                options: controller.prices,
                showMore: false,
                controller: const HomeSubCategoriesFilterScreen(),
                context: context,
                toggleShowMore: () {},
              ),
              SizedBox(
                height: 60.sp,
              )
            ],
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              Get.toNamed(RoutesStrings.availablityRoute);
            },
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.cuisine.map((e) => e.isSelected.value = false).toList();
                      controller.label.map((e) => e.isSelected.value = false).toList();
                      controller.foodTypes.map((e) => e.isSelected.value = false).toList();
                      controller.prices.map((e) => e.isSelected.value = false).toList();
                    },
                    child: Container(
                      height: 50.sp,
                      color: MyColors.red,
                      padding: EdgeInsets.symmetric(vertical: 15.sp),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Clear All',
                        style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (controller.cuisine.any((e) => e.isSelected.value == true) || controller.label.any((e) => e.isSelected.value == true) || controller.foodTypes.any((e) => e.isSelected.value == true) || controller.prices.any((e) => e.isSelected.value == true)) {
                        controller.getRestaurantListApi(
                          cuisineId: (controller.cuisine.any((e) => e.isSelected.value == true)) ? controller.cuisine.where((e) => e.isSelected.value).first.id : '',
                          goodFor: controller.label.where((e) => e.isSelected.value).map((item) => item.name).join(","),
                          foodType: controller.foodTypes.where((e) => e.isSelected.value).map((item) => item.name).join(","),
                          priceLevel: controller.prices.where((e) => e.isSelected.value).map((item) => item.name).join(","),
                          isBack: true,
                        );
                      } else {
                        Fluttertoast.showToast(msg: "Please select at least one filter to apply.", backgroundColor: MyColors.grey.withOpacity(0.8), textColor: MyColors.black);
                      }
                    },
                    child: Container(
                      height: 50.sp,
                      color: MyColors.secondaryColor,
                      padding: EdgeInsets.symmetric(vertical: 15.sp),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Apply Filter',
                        style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16, color: MyColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildFilterSection({
    required String title,
    required List<FilterRestaurant> options,
    required bool showMore,
    required HomeSubCategoriesFilterScreen controller,
    required BuildContext context,
    required void Function() toggleShowMore,
  }) {
    final selectedOptionsString = options.where((e) => e.isSelected.value).map((item) => item.name).join(", ");
    final hasSelectedOptions = selectedOptionsString.isNotEmpty;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts16),
            ),
            18.verticalSpace,
            Divider(color: MyColors.dividerColor, thickness: 1, height: 0),
            if (hasSelectedOptions) 15.verticalSpace else const SizedBox.shrink(),
            Wrap(
              children: [
                Text(
                  selectedOptionsString,
                  style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14),
                ),
              ],
            ),
            if (hasSelectedOptions) 15.verticalSpace else const SizedBox.shrink(),
            GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: showMore ? options.length : (options.length > 8 ? 8 : options.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6.sp,
              ),
              itemBuilder: (context, index) {
                final option = options[index];
                return InkWell(
                  onTap: () {
                    if (title == 'Cuisines') {
                      if (options[index].isSelected.value == true) {
                        options[index].isSelected.value = false;
                        return;
                      }
                      options.map((e) => e.isSelected.value = false).toList();
                      options[index].isSelected.value = true;
                    } else {
                      option.isSelected.value = !option.isSelected.value;
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        option.isSelected.value ? ImageConstants.icFilterChecked : ImageConstants.icFilterUnchecked,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          option.name ?? '',
                          style: Theme.of(context).grayCliff500.copyWith(fontSize: MyFonts.fonts14),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            if (options.length > 8)
              Center(
                child: TextButton(
                  onPressed: toggleShowMore,
                  child: Text(
                    showMore ? 'View Less' : 'View More',
                    style: Theme.of(context).grayCliff600.copyWith(fontSize: MyFonts.fonts14, color: MyColors.secondaryColor),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
