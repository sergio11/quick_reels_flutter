import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/domain/usecase/sign_in_user_use_case.dart';
import 'package:quickreels/app/features/shared/events/app_event_bus.dart';
import 'package:quickreels/app/features/shared/events/events.dart';
import 'package:quickreels/app/features/signin/model/signin_ui_data.dart';

class SignInController extends BaseController<SignInUiData> {

  final SignInUserUseCase signInUserUseCase;
  final AppEventBus appEventBus;

  SignInController({ required this.signInUserUseCase, required this.appEventBus }): super(initialUiState: const SignInUiData());

  void loginUser(String email, String password) async {
    callUseCase(
      signInUserUseCase(SignInParams(email, password)),
      onComplete: (isSuccess) => _handleOnSignInCompleted(isSuccess)
    );
  }

  void _handleOnSignInCompleted(bool isSignIn) {
    print("_handleOnSignInCompleted -> $isSignIn");
    updateState(SignInUiData(isSignInSuccess: isSignIn));
    if(isSignIn) {
      appEventBus.sendEvent(SignInEvent());
    }
  }
}