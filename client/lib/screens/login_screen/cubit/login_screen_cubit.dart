import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/repositories/auth_repository.dart';
import 'package:social_media_with_chatgpt/services/api_response/api_response.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/helpers/bot_toast_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dio_error_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/shared_preference.dart';

part 'login_screen_state.dart';
part 'login_screen_cubit.freezed.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(const LoginScreenState.initial());

  final _authRepository = AuthRepository(apis: PublicApi.apis);

  Future<void> login() async {
    final cancel = showLoading();
    try {
      ApiResponse res =
          await _authRepository.login(state.email!, state.password!);
      if (res.data != null && res.data is Map<String, dynamic>) {
        await sp.setToken(res.data!['token']!, "");
        await _getUser();
      }
      cancel();
    } catch (err) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(err)));
    }
  }

  Future<void> _getUser() async {
    ApiResponse<User> res = await PublicApi.apis.getUser();
    if (res.data != null) {
      emit(state.copyWith(user: res.data));
    }
  }

  updateState(LoginScreenState Function(LoginScreenState) onUpdate) =>
      emit(onUpdate(state));
}
