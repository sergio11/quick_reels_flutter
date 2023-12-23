import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:quickreels/app/domain/model/failure.dart';
import 'package:quickreels/app/domain/model/page_state.dart';
import '/flavors/build_config.dart';

abstract class BaseController<UIState> extends SuperController<UIState> {
  final Logger logger = BuildConfig.instance.config.logger;

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  BuildContext get context => Get.context!;

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  final _messageController = ''.obs;

  String get message => _messageController.value;

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  final UIState initialUiState;

  late Rx<UIState> _uiData;

  UIState get uiData => _uiData.value;

  //Reload the page
  final _refreshController = false.obs;

  final logoutController = false.obs;

  BaseController({required this.initialUiState}) {
    _uiData = initialUiState.obs;
  }

  refreshPage(bool refresh) => _refreshController(refresh);

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  showMessage(String msg) => _messageController(msg);

  showErrorMessage(String msg) => _errorMessageController(msg);

  showSuccessMessage(String msg) => _successMessageController(msg);

  updateState(UIState newState, { bool forceRefresh = false}) {
    _uiData.value = newState;
    if(forceRefresh) {
      _uiData.refresh();
    }
  }

  // ignore: long-parameter-list
  dynamic callUseCase<T>(
    Future<T> future, {
    Function(Failure exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function(bool isSuccess)? onComplete,
  }) async {
    Failure? _exception;
    showLoading();
    if (onStart != null) onStart();
    try {
      final T response = await future;
      hideLoading();
      if (onSuccess != null) onSuccess(response);
      if (onComplete != null) onComplete(true);
      return response;
    } on Failure catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    }
    hideLoading();
    if (onError != null) onError(_exception);
    if (onComplete != null) onComplete(false);
  }

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

}
