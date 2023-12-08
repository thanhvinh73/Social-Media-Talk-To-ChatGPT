import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_screen_state.dart';
part 'conversation_screen_cubit.freezed.dart';

class ConversationScreenCubit extends Cubit<ConversationScreenState> {
  ConversationScreenCubit() : super(ConversationScreenState.initial());
}
