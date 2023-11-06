import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/enum/bottom_tabs.dart';
import '../../../shared/enum/screen_status.dart';

part 'main_screen_state.dart';
part 'main_screen_cubit.freezed.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(const MainScreenState.initial());

  updateState(MainScreenState Function(MainScreenState) onUpdate) =>
      emit(onUpdate(state));
}
