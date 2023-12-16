part of 'account_screent_cubit.dart';

@freezed
class AccountScreentState with _$AccountScreentState {
  const factory AccountScreentState.initial({
    String? errorMessage,
    Profile? profile,
    @Default(ScreenStatus.init) ScreenStatus status,
    @Default([]) List<Post> myPosts,
  }) = _Initial;
}
