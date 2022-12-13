import 'package:clean_login_api/domain/core/constants.dart';
import 'package:get/get.dart';

import '../models/register_response_model.dart';

class RegisterResponseProvider extends GetConnect {
  Future<RegisterResponse> register(String name, String mobile, String email,
      String type_user, String password, String confirm_password) async {
    var response = await post(
        '${apiUrl}register',
        Map.of({
          "name": name,
          "mobile": mobile,
          "email": email,
          "type_user": type_user,
          "password": password,
          "confirm_password": confirm_password
        }));

    print(response.body);

    if (response.isOk) {
      return RegisterResponse.fromJson(response.body);
    } else {
      return Future.error(response.statusText ?? "Failed");
    }
  }

  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return RegisterResponse.fromJson(map);
  //     if (map is List)
  //       return map.map((item) => RegisterResponse.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = 'YOUR-API-URL';
  // }

  // Future<RegisterResponse?> getRegisterResponse(int id) async {
  //   final response = await get('registerresponse/$id');
  //   return response.body;
  // }

  // Future<Response<RegisterResponse>> postRegisterResponse(
  //         RegisterResponse registerresponse) async =>
  //     await post('registerresponse', registerresponse);
  // Future<Response> deleteRegisterResponse(int id) async =>
  //     await delete('registerresponse/$id');
}
