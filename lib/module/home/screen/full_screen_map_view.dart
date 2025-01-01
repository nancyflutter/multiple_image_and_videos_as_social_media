import 'package:multiple_image_and_videos_as_social_media/core/core.dart';

class FullScreenMapView extends StatelessWidget {
  final void Function(GoogleMapController) onMapCreated;
  final LatLng target;
  final List<Marker> marker;
  const FullScreenMapView({
    super.key,
    required this.onMapCreated,
    required this.target,
    required this.marker,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "Map",
          style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp),
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
      body: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: target,
          zoom: 14.0,
        ),
        markers: Set<Marker>.of(marker),
      ),
    );
  }
}
