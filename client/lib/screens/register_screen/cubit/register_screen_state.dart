part of 'register_screen_cubit.dart';

@freezed
class RegisterScreenState with _$RegisterScreenState {
  const factory RegisterScreenState.initial({
    User? currentUser,
    @Default(ScreenStatus.init) ScreenStatus status,
    String? errorMessage,
  }) = _Initial;
}
