import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/shared/enum/main_tabs.dart';

import '../../../shared/enum/screen_status.dart';

part 'main_screen_state.dart';
part 'main_screen_cubit.freezed.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(const MainScreenState.initial());

  changeTab(MainTabs tab) => emit(state.copyWith(currentTab: tab));

  updateState(MainScreenState Function(MainScreenState) onUpdate) =>
      emit(onUpdate(state));
}
