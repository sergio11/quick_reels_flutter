import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/core/utils/utils.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/common_screen_progress_indicator.dart';
import 'package:quickreels/app/domain/model/page_state.dart';
import '/flavors/build_config.dart';

abstract class BaseView<Controller extends BaseController, UIState>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final Logger logger = BuildConfig.instance.config.logger;

  Widget body(BuildContext context, UIState uiData);

  PreferredSizeWidget? appBar(BuildContext context, UIState uiData) => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Obx(() => annotatedRegion(context, controller.uiData)),
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : Container()),
          Obx(() => controller.errorMessage.isNotEmpty
              ? onShowErrorSnackBar(controller.errorMessage)
              : Container()),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context, UIState uiData) {
    if (immersiveMode()) {
      disableSystemUI();
    } else {
      enableSystemUI();
    }
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context, uiData),
      ),
    );
  }

  Widget pageScaffold(BuildContext context, UIState uiData) {
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return false;
        },
        child: Scaffold(
          //sets ios status bar color
          backgroundColor: pageBackgroundColor(),
          key: globalKey,
          appBar: appBar(context, uiData),
          floatingActionButton: floatingActionButton(),
          body: pageContent(context, uiData),
          bottomNavigationBar: bottomNavigationBar(),
          drawer: drawer(),
        ));
  }

  Widget pageContent(BuildContext context, UIState uiData) {
    return SafeArea(
      child: body(context, uiData),
    );
  }

  Widget onShowErrorSnackBar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showErrorSnackBar(context: Get.context!, message: message);
    });
    return Container();
  }

  Color pageBackgroundColor() => AppColors.pageBackground;

  Color statusBarColor() => AppColors.pageBackground;

  Widget? floatingActionButton() => null;

  Widget? bottomNavigationBar() => null;

  Widget? drawer() => null;

  bool immersiveMode() => false;

  Widget _showLoading() => CommonScreenProgressIndicator(
        backgroundColor: AppColors.colorDark.withOpacity(0.5),
        spinnerColor: AppColors.colorPrimary,
      );
}
