import '../models/credential/credential.dart';
import '../models/user/user.dart';
import '../services/api_response/api_response.dart';
import '../services/apis/api_client.dart';

class AuthRepository {
  APIClient apis;
  AuthRepository({required this.apis});

  Future<ApiResponse<Credential>> login(String username, String password) =>
      apis.login({"username": username, "password": password});

  Future logout() => apis.logout();

  Future<ApiResponse<User>> register(User user) {
    return apis.register(user.toJson()
      ..addAll({
        "password": user.password,
        "confirm_password": user.confirmPassword,
      }));
  }

  Future<ApiResponse<Credential>> refreshToken(String refreshToken) =>
      apis.refreshToken({"refresh_token": refreshToken});
}
