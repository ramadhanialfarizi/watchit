import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/authentication_helper.dart';

class SignupProvider extends ChangeNotifier {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool? error;
  String? messageError;
  final AuthHelper _authHelper = AuthHelper();

  void changeObsecurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void changeObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void resetObsecureText() {
    obscurePassword = true;
    obscureConfirmPassword = true;
    notifyListeners();
  }

  Future<void> signUp({required email, required password}) async {
    var signup = await _authHelper.signUpManualy(email, password);

    print(signup);

    if (signup == 'Email already in use') {
      error = true;
      messageError = 'Email already in use';
      notifyListeners();
    } else {
      error = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authHelper.signOut();
    notifyListeners();
  }
}
