import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/features/shared/app_controller.dart';
import 'package:quickreels/app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final appController = Get.find<AppController>();
    if (route != null) {
      final isRouteRestricted = !AppPages.unrestrictedRoutes.contains(route);
      final isAuthenticated = appController.isAuthenticated;
      if (!isAuthenticated && isRouteRestricted) {
        return const RouteSettings(name: Routes.SIGN_IN);
      }
      if (isAuthenticated && !isRouteRestricted) {
        return const RouteSettings(name: Routes.HOME);
      }
    }
    return null;
  }
}
