import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/profile/profile.dart';
import 'package:social_media_with_chatgpt/services/api_response/api_response.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';
import 'package:social_media_with_chatgpt/shared/enum/gender.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/bot_toast_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dio_error_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/validators.dart';

part 'update_profile_screen_state.dart';
part 'update_profile_screen_cubit.freezed.dart';

class UpdateProfileScreenCubit extends Cubit<UpdateProfileScreenState> {
  UpdateProfileScreenCubit() : super(const UpdateProfileScreenState.initial());

  Future updateProfile() async {
    if (state.currentProfile == null) return;
    String? invalidDob = Validators.validateNotEmpty(
        state.currentProfile?.dateOfBirth?.toString() ?? "");
    String? invalidGender =
        Validators.validateNotEmpty(state.currentProfile?.gender?.label);
    if (invalidDob.isNotEmptyOrNull || invalidGender.isNotEmptyOrNull) {
      emit(
          state.copyWith(invalidDob: invalidDob, invalidGender: invalidGender));
      return;
    }

    ///
    /// Handle Update
    ///
    final cancel = showLoading();
    try {
      ApiResponse<Profile> res =
          await PublicApi.apis.updateProfile(state.currentProfile!.toJson());
      if (res.data != null) {
        emit(state.copyWith(
            status: ScreenStatus.success, currentProfile: res.data));
      }
      cancel();
    } catch (err) {
      cancel();
      emit(state.copyWith(errorMessage: parseError(err)));
    }
  }

  updateCurrentProfile(Profile Function(Profile) onUpdate) =>
      emit(state.copyWith(
          currentProfile: onUpdate(state.currentProfile ?? const Profile())));

  updateState(
          UpdateProfileScreenState Function(UpdateProfileScreenState)
              onUpdate) =>
      emit(onUpdate(state));
}
