import 'package:clean_login_api/domain/core/providers/login_response_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var loginProvider = LoginResponseProvider();

  var isLoginSuccess = false.obs;
  var isHidePassword = true.obs;

  login() async {
    await loginProvider
        .login(usernameController.text, passwordController.text)
        .then((value) {
      if (value.isSuccess ?? false) {
        isLoginSuccess.value = true;
        Get.snackbar("Success", "Login Success");
      } else {
        isLoginSuccess.value = false;
        Get.snackbar("Error", "Login Error ${value.message}");
      }
    });
  }
}
