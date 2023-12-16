import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/services/api_response/api_response.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dio_error_helper.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.initial());

  final apis = PublicApi.apis;

  Future getAllPost() async {
    try {
      ApiResponse<List<Post>> res = await apis.getAllPost();
      emit(state.copyWith(posts: res.data ?? []));
    } catch (err) {
      emit(state.copyWith(errorMessage: parseError(err)));
    }
  }

  Future getUpdatePostById(String postId) async {
    try {
      ApiResponse<Post> res = await apis.getPostById(postId);
      if (res.data != null) {
        emit(state.copyWith(
            posts: state.posts.update((item) => res.data!,
                (item) => item.postId == res.data!.postId)));
      }
    } catch (err) {
      emit(state.copyWith(errorMessage: parseError(err)));
    }
  }

  updateState(HomeScreenState Function(HomeScreenState) onUpdate) =>
      emit(onUpdate(state));
}
