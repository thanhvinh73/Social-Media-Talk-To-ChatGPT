import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';

import '../models/credential/credential.dart';
import '../shared/utils/shared_preference.dart';

class AppDio with DioMixin implements Dio {
  AppDio() {
    options = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          'Content-Type': "application/json",
        });
    if (kDebugMode) {
      interceptors.add(
        PrettyDioLogger(requestBody: true),
      );
    }

    interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final String? token = sp.prefs.getString('access_token');
        if (token.isNotEmptyOrNull) {
          options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (error, handler) async {
        final String? rfToken = sp.prefs.getString('refresh_token');
        if (error.response != null) {
          if (error.requestOptions.headers.containsKey('Authorization')) {
            if (error.response?.data is Map &&
                error.response?.data['error'] is Map &&
                error.response?.data['error']['code'] == 'ERR.TOK002') {
              await _refreshToken(rfToken ?? "");
            }
            if (error.response?.data is Map &&
                error.response?.data['error'] is Map &&
                (error.response?.data['error']['code'] == 'ERR.TOK0101' ||
                    error.response?.data['error']['code'] == 'ERR.TOK0103')) {
              sp.prefs.clear();
            }
            handler.next(error);
          } else {
            handler.next(error);
          }
        } else {
          handler.next(error);
        }
      },
    ));
    httpClientAdapter = HttpClientAdapter();
  }
}

Future<Credential?> _refreshToken(String refreshToken) async {
  try {
    // final AuthRepository authRepository = AuthRepository(apis: PublicApi.apis);
    sp.clear();
    // ApiResponse<Credential> res =
    //     await authRepository.refreshToken(refreshToken);
    // if (res.data != null) {
    //   sp.setToken(res.data!.accessToken, res.data!.refreshToken);
    //   return res.data;
    // }
    return null;
  } catch (err) {
    return null;
  }
}
