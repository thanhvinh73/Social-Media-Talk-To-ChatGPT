import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/comment/comment.dart';
import 'package:social_media_with_chatgpt/services/api_response/api_response.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/file_ext.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/bot_toast_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dio_error_helper.dart';

part 'comment_screen_state.dart';
part 'comment_screen_cubit.freezed.dart';

class CommentScreenCubit extends Cubit<CommentScreenState> {
  CommentScreenCubit() : super(CommentScreenState.initial());

  final apis = PublicApi.apis;

  Future getComments(String postId) async {
    try {
      ApiResponse<List<Comment>> res = await apis.getCommentsByPost(postId);
      emit(state.copyWith(comments: res.data ?? []));
    } catch (e) {
      emit(state.copyWith(errorMessage: parseError(e)));
    }
  }

  Future createComment(String postId) async {
    if (state.currentComment == null ||
        state.currentComment!.content.isEmptyOrNull) return;

    final cancel = showLoading();
    try {
      List<MultipartFile>? files;
      if (state.currentComment!.files.isNotNullOrEmpty) {
        files = await Future.wait<MultipartFile>(state.currentComment!.files
            .map((file) =>
                MultipartFile.fromFile(file.path, filename: file.name)));
      }

      FormData body = FormData.fromMap({
        "content": state.currentComment!.content,
        if (files.isNotNullOrEmpty) "images": files
      });
      ApiResponse<Comment> res = await apis.createComment(postId, body);
      if (res.data != null) {
        emit(state.copyWith(
            currentComment: res.data, status: ScreenStatus.success));
      }
      cancel();
    } catch (e) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(e)));
    }
  }

  updateCurrentComment(Comment Function(Comment) onUpdate) =>
      emit(state.copyWith(
          currentComment: onUpdate(state.currentComment ?? const Comment())));

  updateState(CommentScreenState Function(CommentScreenState) onUpdate) =>
      emit(onUpdate(state));
}
