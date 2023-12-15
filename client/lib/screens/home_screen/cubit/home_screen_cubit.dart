import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.initial());

  updateState(HomeScreenState Function(HomeScreenState) onUpdate) =>
      emit(onUpdate(state));
}
