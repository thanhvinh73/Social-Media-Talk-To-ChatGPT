import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/services/api_response/api_response.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/file_ext.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/bot_toast_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dio_error_helper.dart';

part 'create_post_screen_state.dart';
part 'create_post_screen_cubit.freezed.dart';

class CreatePostScreenCubit extends Cubit<CreatePostScreenState> {
  CreatePostScreenCubit(Post? post)
      : super(CreatePostScreenState.initial(
            currentPost: post, isUpdate: post != null));

  final apis = PublicApi.apis;

  Future createPost() async {
    if (state.currentPost == null ||
        state.currentPost!.title.isEmptyOrNull ||
        state.currentPost!.description.isEmptyOrNull) return;
    final cancel = showLoading();
    try {
      List<MultipartFile>? files;
      if (state.currentPost!.imageFile.isNotNullOrEmpty) {
        files = await Future.wait<MultipartFile>(state.currentPost!.imageFile
            .map((file) =>
                MultipartFile.fromFile(file.path, filename: file.name)));
      }
      FormData body = FormData.fromMap({
        "title": state.currentPost!.title,
        "description": state.currentPost!.description,
        if (files.isNotNullOrEmpty) "images": files
      });
      ApiResponse<Post> res = await apis.createPost(body);
      if (res.data != null) {
        emit(state.copyWith(
            currentPost: res.data, status: ScreenStatus.success));
      }
      cancel();
    } catch (e) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(e)));
    }
  }

  Future updatePost() async {
    if (state.currentPost == null ||
        state.currentPost!.title.isEmptyOrNull ||
        state.currentPost!.description.isEmptyOrNull) return;
    final cancel = showLoading();
    try {
      List<FileModel> images = [];
      if (state.currentPost!.imageFile.isNotNullOrEmpty) {
        images = await uploadFile(state.currentPost!.imageFile);
      }

      Post body = state.currentPost!;
      body = body.copyWith(images: images);

      ApiResponse<Post> res =
          await apis.updatePost(state.currentPost!.postId!, body.toJson());
      if (res.data != null) {
        emit(state.copyWith(
            currentPost: res.data, status: ScreenStatus.success));
      }
      cancel();
    } catch (e) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(e)));
    }
  }

  Future deleteCurrentPost() async {
    if (state.currentPost == null) return;
    final cancel = showLoading();
    try {
      await apis.deletePost(state.currentPost!.postId!);
      cancel();
    } catch (e) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(e)));
    }
  }

  Future<List<FileModel>> uploadFile(List<File> files) async {
    if (files.isNullOrEmpty) return [];
    try {
      List<MultipartFile>? files;
      if (state.currentPost!.imageFile.isNotNullOrEmpty) {
        files = await Future.wait<MultipartFile>(state.currentPost!.imageFile
            .map((file) =>
                MultipartFile.fromFile(file.path, filename: file.name)));
      }
      FormData body =
          FormData.fromMap({if (files.isNotNullOrEmpty) "files": files});
      ApiResponse<List<FileModel>> res = await apis.uploadMultiFile(body);
      return res.data ?? [];
    } catch (e) {}
    return [];
  }

  updateCurrentPost(Post Function(Post) onUpdate) => emit(
      state.copyWith(currentPost: onUpdate(state.currentPost ?? const Post())));

  updateState(CreatePostScreenState Function(CreatePostScreenState) onUpdate) =>
      emit(onUpdate(state));
}
