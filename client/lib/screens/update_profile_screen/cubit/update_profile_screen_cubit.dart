import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_screen_state.dart';
part 'update_profile_screen_cubit.freezed.dart';

class UpdateProfileScreenCubit extends Cubit<UpdateProfileScreenState> {
  UpdateProfileScreenCubit() : super(UpdateProfileScreenState.initial());
}
