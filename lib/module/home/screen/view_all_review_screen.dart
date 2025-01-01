import 'package:multiple_image_and_videos_as_social_media/core/core.dart';
import 'package:multiple_image_and_videos_as_social_media/core/utils/commons/common_rating_bar.dart';

class ViewAllReviewScreen extends StatelessWidget {
  const ViewAllReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: Text(
          "Reviews",
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
        elevation: 0.5,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => reviewTile(context),
      ),
    );
  }

  Widget reviewTile(BuildContext context) {
    return Card(
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
    );
  }
}
