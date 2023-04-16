import 'package:flutter/material.dart';

import '../../../core/helper/authentication_helper.dart';

class SigninProvider extends ChangeNotifier {
  bool obscurePassword = true;
  bool? error;
  final AuthHelper _authHelper = AuthHelper();

  void changeObsecurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> signIn({required email, required password}) async {
    var signin = await _authHelper.signInManualy(email, password);

    if (signin == null) {
      error = true;
      notifyListeners();
    } else {
      error = false;
      notifyListeners();
    }
  }
}
