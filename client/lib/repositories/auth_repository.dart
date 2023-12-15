import '../models/user/user.dart';
import '../services/api_response/api_response.dart';
import '../services/apis/api_client.dart';

class AuthRepository {
  APIClient apis;
  AuthRepository({required this.apis});

  Future<ApiResponse> login(String email, String password) =>
      apis.login({"email": email, "password": password});

  // Future logout() => apis.logout();

  Future<ApiResponse<User>> register(User user) {
    return apis.register(user.toJson()
      ..addAll({
        "password": user.password,
      }));
  }

  // Future<ApiResponse<Credential>> refreshToken(String refreshToken) =>
  //     apis.refreshToken({"refresh_token": refreshToken});
}
