part of 'comment_screen_cubit.dart';

@freezed
class CommentScreenState with _$CommentScreenState {
  const factory CommentScreenState.initial({
    String? errorMessage,
    @Default(ScreenStatus.init) ScreenStatus status,
    @Default([]) List<Comment>? comments,
    Comment? currentComment,
  }) = _Initial;
}
