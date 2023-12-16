import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/models/profile/profile.dart';
import 'package:social_media_with_chatgpt/services/api_response/api_response.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/file_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/bot_toast_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dio_error_helper.dart';

part 'account_screent_state.dart';
part 'account_screent_cubit.freezed.dart';

class AccountScreentCubit extends Cubit<AccountScreentState> {
  AccountScreentCubit() : super(AccountScreentState.initial());

  final apis = PublicApi.apis;

  Future updateProfile() async {
    if (state.profile == null) return;
    final cancel = showLoading();
    try {
      ApiResponse<Profile> response =
          await apis.updateProfile(state.profile!.toJson());
      if (response.data != null) {
        emit(state.copyWith(profile: response.data));
      }
      cancel();
    } catch (err) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(err)));
    }
  }

  Future updateImage() async {
    final cancel = showLoading();
    try {
      MultipartFile? avatar;
      MultipartFile? coverPhoto;

      if (state.profile?.avatarFile != null) {
        avatar = await MultipartFile.fromFile(state.profile!.avatarFile!.path,
            filename: state.profile!.avatarFile!.name);
      }

      if (state.profile?.coverPhotoFile != null) {
        coverPhoto = await MultipartFile.fromFile(
            state.profile!.coverPhotoFile!.path,
            filename: state.profile!.coverPhotoFile!.name);
      }
      FormData body = FormData.fromMap({
        if (avatar != null) "avatar": avatar,
        if (coverPhoto != null) "cover_photo": coverPhoto
      });

      ApiResponse<Profile> response = await apis.updateProfileImage(body);
      if (response.data != null) {
        emit(state.copyWith(
            profile: response.data, status: ScreenStatus.success));
      }
      cancel();
    } catch (err) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(err)));
    }
  }

  Future getMyPost() async {
    try {
      ApiResponse<List<Post>> res = await apis.getMyPost();
      emit(state.copyWith(myPosts: res.data ?? []));
    } catch (err) {
      emit(state.copyWith(errorMessage: null));
    }
  }

  updateCurrentProfile(Profile Function(Profile) onUpdate) =>
      emit(state.copyWith(profile: onUpdate(state.profile ?? const Profile())));

  updateState(AccountScreentState Function(AccountScreentState) onUpdate) =>
      emit(onUpdate(state));
}
