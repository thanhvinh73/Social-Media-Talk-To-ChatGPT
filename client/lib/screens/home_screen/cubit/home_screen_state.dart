part of 'home_screen_cubit.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial({
    String? errorMessage,
    @Default([]) List<Post> posts,
  }) = _Initial;
}
