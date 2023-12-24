import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/domain/usecase/sign_in_user_use_case.dart';
import 'package:quickreels/app/features/signin/model/signin_ui_data.dart';

class SignInController extends BaseController<SignInUiData> {

  final SignInUserUseCase signInUserUseCase;

  SignInController({ required this.signInUserUseCase }): super(initialUiState: const SignInUiData());

  void loginUser(String email, String password) async {
    if(email.isNotEmpty && password.isNotEmpty) {
      callUseCase(
          signInUserUseCase(SignInParams(email, password)),
          onComplete: (isSuccess) => _handleOnSignInCompleted(isSuccess)
      );
    } else {
      showErrorMessage('Please enter all the fields');
    }
  }

  void _handleOnSignInCompleted(bool isSignIn) {
    updateState(SignInUiData(isSignInSuccess: isSignIn));
  }
}