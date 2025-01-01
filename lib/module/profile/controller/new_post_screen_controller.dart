import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import '../../../core/core.dart';

class NewPostScreenController extends GetxController {
  RxString abc = RxString('abc');
  final appController = Get.find<AppController>();
  Rx<TextEditingController> descriptionController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> searchController = Rx<TextEditingController>(TextEditingController());
  RxList<PlatformFile> imageList = RxList<PlatformFile>([]);
  RxList<UsersTagSearchResponse> tagSearchList = RxList([]);
  Timer? _debounce;
  Rx<UsersTagSearchResponse?> selectedTag = Rx<UsersTagSearchResponse?>(null);

  @override
  onInit() {
    if (Get.arguments != null && Get.arguments['imageList'] != null) {
      imageList.value = List<PlatformFile>.from(Get.arguments['imageList']);
    }
    super.onInit();
  }

  addPost() async {
    var request = http.MultipartRequest('POST', Uri.parse("http://178.62.125.124:4002/api/post/add_post"));
    AppLoader.showLoader();

    for (PlatformFile file in imageList) {
      var multipartFile = await http.MultipartFile.fromPath('media', file.path ?? "", filename: file.name, contentType: MediaType.parse(getMimeType(file.path ?? "")));
      request.files.add(multipartFile);
    }

    request.headers.addAll(appController.getHeader());
    request.fields['publisher_id'] = appController.loginResponse.value.userId.toString();
    request.fields['post_by'] = "u";
    request.fields['title'] = "${selectedTag.value?.serviceName}";
    request.fields['description'] = descriptionController.value.text.trim();
    request.fields['location'] = "${selectedTag.value?.supplierAddress}";
    request.fields['tag'] = "${selectedTag.value?.id}";

    Console.debugLog("Url : $request");
    Console.debugLog("Payload : ${request.fields}");

    try {
      http.Response response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        AppLoader.removeLoader();
        Get.put<DashboardScreenController>(DashboardScreenController());
        final profileScreenCnt = Get.find<DashboardScreenController>();
        profileScreenCnt.goToProfile();
      }
      Console.debug("====================================== MULTIPART ======================================");
      Console.debug("Api : http://178.62.125.124:4002/api/post/add_post");
      Console.debug("Header : ${appController.getHeader()}");
      Console.debug("PayLoad : ${request.fields}");
      Console.debug("------------------------RESPONSE--------------------------");
      Console.debug("statusCode :::::: ${response.statusCode}");
      Console.debug("body :::::: ${response.body}");
      Console.debug("headers :::::: ${response.headers}");
      Console.debug("===================================================================================");
    } catch (e) {
      Console.debug(e, key: "RESPONSE");
    }
  }

  String getMimeType(String filePath) {
    final extension = filePath.split('.').last;
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'mp4':
        return 'video/mp4';
      case 'mov':
        return 'video/quicktime';
      default:
        return 'application/octet-stream';
    }
  }

  /// search user
  onSearchUser(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      getTagSearchListAPI(value: value);
    });
  }

  /// in progress
  getTagSearchListAPI({required String value}) async {
    UsersTagSearchPayLoad payLoad = UsersTagSearchPayLoad(
      search: value,
    );

    var usersTagSearchResponse = await ApiRepository.getUsersTagSearchApi(payLoad);
    if (usersTagSearchResponse != null) {
      tagSearchList.value = usersTagSearchResponse;
    }
  }
}
