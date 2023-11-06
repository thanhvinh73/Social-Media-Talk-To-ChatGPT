import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/credential/credential.dart';
import '../../models/user/user.dart';
import '../api_response/api_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  // Auth
  @POST('/api/auth/login')
  Future<ApiResponse<Credential>> login(@Body() Map<String, dynamic> body);

  @POST('/api/auth/revoke')
  Future<ApiResponse<dynamic>> logout();

  @POST("/api/auth/register")
  Future<ApiResponse<User>> register(@Body() Map<String, dynamic> body);

  @POST('/api/refresh_token')
  Future<ApiResponse<Credential>> refreshToken(
      @Body() Map<String, dynamic> body);

  // User
  @GET('/api/users')
  Future<ApiResponse<User>> getUser();
}
