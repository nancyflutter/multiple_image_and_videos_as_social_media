import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:multiple_image_and_videos_as_social_media/core/core.dart';
import 'package:multiple_image_and_videos_as_social_media/module/profile/model/edit_profile_payload.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api_repository.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/model/api_response_model.dart';

class EditProfileScreenController extends GetxController {
  RxInt abc = RxInt(0);
  RxString selectedImage = RxString("");
  Rx<TextEditingController> nameController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> bioController = Rx<TextEditingController>(TextEditingController());
  final appController = Get.find<AppController>();
  final profileController = Get.find<ProfileScreenController>();
  Rx<ApiResponseModel> editProfileData = Rx(ApiResponseModel(statusCode: 0));

  RxString image = RxString("");
  RxString fullName = RxString("");
  RxString bio = RxString("");
  RxBool isValidData = RxBool(false);

  @override
  void onInit() {
    if (Get.arguments != null) {
      image.value = Get.arguments['image'];
      fullName.value = Get.arguments['full_name'];
      bio.value = Get.arguments['bio'].toString() != 'null' ? Get.arguments['bio'].toString() : '';
    }

    super.onInit();
  }

  setData({
    required String userName,
    required String userImage,
    required String bio,
  }) {
    nameController.value.text = userName.trim();
    selectedImage.value = userImage;
    bioController.value.text = bio.trim();
  }

  isValidPage() {
    if (fullName.value.trim() != nameController.value.text.trim() || image.value != selectedImage.value || bio.value.trim() != bioController.value.text.trim()) {
      isValidData.value = true;
    }
  }

  Future<File?> downloadImageUsingHttp(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var dir = await getTemporaryDirectory();
        String filePath = "${dir.path}/tempImage.jpg";
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return file;
      } else {
        if (kDebugMode) {
          print("Failed to download image. Status code: ${response.statusCode}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error downloading image: $e");
      }
      return null;
    }
  }

  editProfileAPI() async {
    try {
      String? imagePath;
      if (selectedImage.value.startsWith('http')) {
        File? file = await downloadImageUsingHttp(selectedImage.value);
        if (file != null) {
          imagePath = file.path;
        } else {
          if (kDebugMode) {
            print("Error: Unable to download image");
          }
          return;
        }
      } else {
        imagePath = selectedImage.value;
      }

      EditProfilePayload payLoad = EditProfilePayload(
        userId: appController.loginResponse.value.userId.toString(),
        image: imagePath,
        fullName: nameController.value.text,
        gender: "",
        bio: bioController.value.text,
      );

      if (kDebugMode) {
        print("Payload:::::::::::::::::::::::::::::::::::::::::::: ${payLoad.toJson()}");
      }

      ApiResponseModel? editProfileResponse = await ApiRepository.editProfileApiMultiPart(
        bodyData: payLoad,
        filename: imagePath,
        name: nameController.value.text,
        bio: bioController.value.text,
      );
      if (editProfileResponse?.responseCode == '1') {
        editProfileData.value = editProfileResponse as ApiResponseModel;
        isValidData.value = false;
      }
      profileController.userProfileAPI(); // Update profile data
      Get.back();
    } catch (e) {
      if (kDebugMode) {
        print("Error in editProfileAPI: $e");
      }
    }
  }

  Future<String?> selectImagePopup(context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.sp))),
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                pickImage(ImageSource.camera).then((result) {
                  Navigator.pop(context, result);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () async {
                pickImage(ImageSource.gallery).then((result) {
                  Navigator.pop(context, result);
                });
              },
            ),
          ],
        );
      },
    );
  }

  Future<String?> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      selectedImage.value = pickedImage.path;
      isValidPage();
    }
    return null;
  }
}
