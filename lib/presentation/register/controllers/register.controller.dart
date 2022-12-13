import 'package:clean_login_api/domain/core/providers/register_response_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var typeUserController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var registerProvider = RegisterResponseProvider();
  var isRegisterSuccess = false.obs;

  var isHidePassword = true.obs;
  var isHidePassword1 = true.obs;

  register() async {
    await registerProvider
        .register(
            nameController.text,
            mobileController.text,
            emailController.text,
            typeUserController.text,
            passwordController.text,
            confirmPasswordController.text)
        .then((value) {
      if (value.isSuccess ?? false) {
        isRegisterSuccess.value = true;
        Get.snackbar("Success", "Register Success");
      } else {
        isRegisterSuccess.value = false;
        Get.snackbar("Error", "Register Error ${value.message}");
      }
    });
  }
}
