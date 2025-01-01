import 'package:get/get.dart';
import 'package:multiple_image_and_videos_as_social_media/services/api/api.dart';
import 'package:flutter/material.dart';

const double VALUE_FIGMA_DESIGN_WIDTH = 1125.0;
const double VALUE_FIGMA_DESIGN_HEIGHT = 2436.0;

const double NEW_VALUE_FIGMA_DESIGN_WIDTH = 430.0;
const double NEW_VALUE_FIGMA_DESIGN_HEIGHT = 932.0;

final navigatorKey = GlobalKey<NavigatorState>();


final apiService = Get.find<ApiRepository>();