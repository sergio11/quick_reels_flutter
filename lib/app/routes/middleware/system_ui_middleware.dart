

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/routes/app_pages.dart';

class SystemUiMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (AppPages.immersiveModeRoutes.contains(route)) {
      disableSystemUI();
    } else {
      enableSystemUI();
    }
    return null;
  }
}