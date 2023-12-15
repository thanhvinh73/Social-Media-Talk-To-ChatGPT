import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/repositories/auth_repository.dart';
import 'package:social_media_with_chatgpt/services/api_response/api_response.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/helpers/bot_toast_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dio_error_helper.dart';

part 'register_screen_state.dart';
part 'register_screen_cubit.freezed.dart';

class RegisterScreenCubit extends Cubit<RegisterScreenState> {
  RegisterScreenCubit() : super(const RegisterScreenState.initial());

  final _authRepository = AuthRepository(apis: PublicApi.apis);

  Future<void> register() async {
    if (state.currentUser == null) return;
    final cancel = showLoading();
    try {
      ApiResponse<User> res =
          await _authRepository.register(state.currentUser!);
      if (res.data != null) {
        emit(state.copyWith(status: ScreenStatus.success));
      }
      cancel();
    } catch (err) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(err)));
    }
  }

  updateCurrentUser(User Function(User) onUpdate) => emit(
      state.copyWith(currentUser: onUpdate(state.currentUser ?? const User())));

  updateState(RegisterScreenState Function(RegisterScreenState) onUpdate) =>
      emit(onUpdate(state));
}
