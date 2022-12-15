
import 'dart:convert';

import 'package:clean_login_api/domain/core/models/login_response_model.dart';
import 'package:clean_login_api/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  var user = Data().obs;
  void preferences() async {
    var preference = await SharedPreferences.getInstance();

    var dataUser = preference.getString("data");

    if (dataUser != null) {
      user.value = Data.fromJson(jsonDecode(dataUser));
      Get.snackbar("Success", user.value.name ?? "");
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("data");
    Get.offAllNamed(Routes.LOGIN);
  }
}
