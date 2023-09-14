import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../app/constant.dart';
import '../responses/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      @Field("imei") String imei,
      @Field("deviceType") String deviceType);

  @POST("/customers/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);

  @POST("/customers/login")
  Future<AuthenticationResponse> register(
    @Field("country_mobile_code") String country_mobile_code,
    @Field("user_name") String user_name,
    @Field("password") String password,
    @Field("mobile_number") String mobile_number,
    @Field("profile_picture") String profile_picture,
  );
}
