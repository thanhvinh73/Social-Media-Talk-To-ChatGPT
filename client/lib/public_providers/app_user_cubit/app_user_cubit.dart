import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:social_media_with_chatgpt/models/profile/profile.dart';
import 'package:social_media_with_chatgpt/services/api_response/api_response.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';

import '../../models/user/user.dart';

part 'app_user_cubit.freezed.dart';
part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(const AppUserState.initial());

  updateUser(User? user) async {
    try {
      ApiResponse<Profile> res = await PublicApi.apis.getUserProfile();
      emit(state.copyWith(user: user, profile: res.data));
    } catch (e) {
      e.printError();
    }
  }

  updateState(AppUserState Function(AppUserState) onUpdate) =>
      emit(onUpdate(state));
}
