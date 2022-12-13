class LoginResponse {
  bool? isSuccess;
  String? message;
  Data? data;

  LoginResponse({this.isSuccess, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? username;
  String? name;
  dynamic imageProfile;
  String? loginType;
  String? typeUser;
  Detail? detail;
  String? token;
  dynamic fcmToken;

  Data(
      {this.userId,
      this.username,
      this.name,
      this.imageProfile,
      this.loginType,
      this.typeUser,
      this.detail,
      this.token,
      this.fcmToken});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    imageProfile = json['image_profile'];
    loginType = json['login_type'];
    typeUser = json['type_user'];
    detail = json['detail'] != null ? Detail?.fromJson(json['detail']) : null;
    token = json['token'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['username'] = username;
    data['name'] = name;
    data['image_profile'] = imageProfile;
    data['login_type'] = loginType;
    data['type_user'] = typeUser;
    if (detail != null) {
      data['detail'] = detail?.toJson();
    }
    data['token'] = token;
    data['fcm_token'] = fcmToken;
    return data;
  }
}

class Detail {
  int? petaniId;
  dynamic latitude;
  dynamic longitude;

  Detail({this.petaniId, this.latitude, this.longitude});

  Detail.fromJson(Map<String, dynamic> json) {
    petaniId = json['petani_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['petani_id'] = petaniId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
