class LoginRequest {
  String email;
  String password;
  String imei;
  String deviceType;

  LoginRequest(this.email, this.password, this.imei, this.deviceType);
}

class RegisterRequest {
  String country_mobile_code;
  String user_name;
  String password;
  String mobile_number;
  String profile_picture;

  RegisterRequest(this.country_mobile_code, this.user_name, this.password,
      this.mobile_number, this.profile_picture);
}
