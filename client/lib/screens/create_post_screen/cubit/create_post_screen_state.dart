part of 'create_post_screen_cubit.dart';

@freezed
class CreatePostScreenState with _$CreatePostScreenState {
  const factory CreatePostScreenState.initial({
    String? errorMessage,
    Post? currentPost,
    @Default(false) bool isUpdate,
    @Default(ScreenStatus.init) ScreenStatus status,
  }) = _Initial;
}
