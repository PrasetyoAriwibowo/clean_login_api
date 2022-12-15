import 'dart:convert';

import 'package:clean_login_api/domain/core/providers/login_response_provider.dart';
import 'package:clean_login_api/infrastructure/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var loginProvider = LoginResponseProvider();

  var isLoginSuccess = false.obs;
  var isHidePassword = true.obs;

  login() async {
    var preferences = await SharedPreferences.getInstance();
    await loginProvider
        .login(usernameController.text, passwordController.text)
        .then((value) {
      if (value.isSuccess ?? false) {
        isLoginSuccess.value = true;
        Get.snackbar("Success", "Login Success");
        preferences.setString("data", jsonEncode(value.data?.toJson()));

        Get.toNamed(Routes.DASHBOARD);

      } else {
        isLoginSuccess.value = false;
        Get.snackbar("Error", "Login Error ${value.message}");
      }
    }).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString());
    });
  }

  void checkLogin() async {
    var preferences = await SharedPreferences.getInstance();
    var dataPreferences = preferences.getString("data");
  
  if (dataPreferences != null) {
    Get.offNamed(Routes.DASHBOARD);
  }
  }
}


