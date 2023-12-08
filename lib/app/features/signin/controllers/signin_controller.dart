import 'package:get/get.dart';
import 'package:quickreels/app/core/base/base_controller.dart';
import 'package:quickreels/app/domain/usecase/sign_in_user_use_case.dart';
import 'package:quickreels/app/features/signin/model/signin_ui_data.dart';

class SignInController extends BaseController {

  final SignInUserUseCase signInUserUseCase;

  final Rx<SignInUiData> _uiData = const SignInUiData().obs;

  SignInUiData get uiData => _uiData.value;

  SignInController({ required this.signInUserUseCase });

  @override
  void onReady() {
    super.onReady();
   /* _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);*/
  }

  /*_setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => SignupScreen());
    } else {
      //Get.offAll(() => const HomeScreen());
    }
  }*/

  void loginUser(String email, String password) async {
    callUseCase(
      signInUserUseCase(SignInParams(email, password)),
    );
  }
}