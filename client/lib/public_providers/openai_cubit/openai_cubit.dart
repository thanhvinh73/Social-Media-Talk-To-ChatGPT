import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/message/message.dart';
import '../../services/services/openai_service/i_openai_service.dart';
import '../../services/services/openai_service/openai_service_impl.dart';

part 'openai_state.dart';
part 'openai_cubit.freezed.dart';

class OpenaiCubit extends Cubit<OpenaiState> {
  OpenaiCubit() : super(const OpenaiState());

  final IOpenAiService _openAiService = OpenAiServiceImpl();

  void requestOpenAi(String request) async {
    if (request.isNotEmpty) {
      try {
        emit(state.copyWith(isGenerating: true));
        OpenAIChatCompletionModel model = await _openAiService
            .createChat(request)
            .timeout(const Duration(seconds: 60));

        emit(state.copyWith(
            currentOpenAiText: model.choices.first.message.content,
            isGenerating: false));
      } on TimeoutException {
        emit(state.copyWith(
            currentOpenAiText: "",
            isGenerating: false,
            errorMessage: "Something was wrong!"));
      } on RequestFailedException {
        emit(state.copyWith(isGenerating: false, errorMessage: "Many Request"));
      }
    }
  }

  void updateCurrentOpenAiMessage({Message? message, required bool isDone}) {
    if (isDone && state.currentOpenAiMessage != null) {
      emit(state.copyWith(
        currentOpenAiMessage: state.currentOpenAiMessage!
            .copyWith(message: state.currentOpenAiText, isDone: true),
        currentOpenAiText: "",
      ));
    } else {
      emit(state.copyWith(currentOpenAiMessage: message));
    }
  }

  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));
  updateState(OpenaiState Function(OpenaiState) onUpdate) =>
      emit(onUpdate(state));
}
