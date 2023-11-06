import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_screen_state.dart';
part 'register_screen_cubit.freezed.dart';

class RegisterScreenCubit extends Cubit<RegisterScreenState> {
  RegisterScreenCubit() : super(const RegisterScreenState.initial());

  updateState(RegisterScreenState Function(RegisterScreenState) onUpdate) =>
      emit(onUpdate(state));
}
