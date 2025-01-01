import '../../../core/core.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColors.materialScaffoldBackground,
              elevation: 0,
              leading: Image.asset(
                scale: 3,
                ImageConstants.iconBack,
              ).addGesture(
                () {
                  Get.back();
                },
              ),
            ),
            // bottomNavigationBar: Padding(
            //   padding: EdgeInsets.only(right: 20.sp, left: 20.sp, bottom: 25.sp),
            //   child: CommonButton(onTap: () {}, buttonText: 'Continue'),
            // ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CommonTextField(
                    controller: controller.searchLocationController.value,
                    labelText: 'Search...',
                    prefix: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image(
                        image: AssetImage(ImageConstants.icSearch),
                        fit: BoxFit.cover,
                        height: 5,
                        width: 5,
                      ),
                    ),
                    suffix: IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: MyColors.grey,
                      ),
                      onPressed: () {
                        controller.searchLocationController.value.clear();
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.placeList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await controller.getLatLngFromPlaceId(controller.placeList[0]['place_id']);
                            controller.address.value = controller.placeList[index]["description"];
                            StorageService.setKey(key: StorageConstants.userPrefAddress, value: controller.address.value);
                            controller.searchLocationController.value.text = controller.placeList[index]["description"];
                            Get.back();
                            controller.searchLocationController.value.clear();
                          },
                          child: ListTile(
                            title: Text(
                              controller.placeList[index]["description"],
                              style: Theme.of(context).grayCliff600.copyWith(
                                    fontSize: 16.sp,
                                  ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
