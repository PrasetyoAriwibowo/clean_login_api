import 'package:clean_login_api/domain/core/constants.dart';
import 'package:get/get.dart';

import '../models/login_response_model.dart';

class LoginResponseProvider extends GetConnect {
  Future<LoginResponse> login(String username, String password) async {
    var response = await post(
        '${apiUrl}login', Map.of({"username": username, "password": password}));

    // print(response.body);
    if (response.isOk) {
      return LoginResponse.fromJson(response.body);
    } else {
      return Future.error(response.statusText ?? "Failed");
    }
  }
}
