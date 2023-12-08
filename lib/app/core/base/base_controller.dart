import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:quickreels/app/domain/model/failure.dart';
import 'package:quickreels/app/domain/model/page_state.dart';
import '/flavors/build_config.dart';

abstract class BaseController extends GetxController {
  final Logger logger = BuildConfig.instance.config.logger;

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;
  //Reload the page
  final _refreshController = false.obs;

  final logoutController = false.obs;

  final _messageController = ''.obs;

  String get message => _messageController.value;

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  refreshPage(bool refresh) => _refreshController(refresh);

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  showMessage(String msg) => _messageController(msg);

  showErrorMessage(String msg) => _errorMessageController(msg);

  showSuccessMessage(String msg) => _successMessageController(msg);

  // ignore: long-parameter-list
  dynamic callUseCase<T>(
    Future<T> future, {
    Function(Failure exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Failure? _exception;
    onStart == null ? showLoading() : onStart();
    try {
      final T response = await future;
      if (onSuccess != null) onSuccess(response);
      onComplete == null ? hideLoading() : onComplete();
      return response;
    } on Failure catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    }
    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }
}
