import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/services/text_to_speech_service/i_text_to_speech_service.dart';
import '../../services/services/text_to_speech_service/text_to_speech_service_impl.dart';

part 'text_to_speech_state.dart';
part 'text_to_speech_cubit.freezed.dart';

class TextToSpeechCubit extends Cubit<TextToSpeechState> {
  TextToSpeechCubit() : super(const TextToSpeechState());

  final ITextToSpeechService _textToSpeechService =
      TextToSpeechServiceImpl(languageCode: "vi-VN");

  void speak(String text) async {
    if (text.isNotEmpty) {
      emit(state.copyWith(isSpeaking: true));
      // (_textToSpeechService as TextToSpeechServiceImpl).volume(0.5);
      // (_textToSpeechService as TextToSpeechServiceImpl).pitch(0.5);
      // (_textToSpeechService as TextToSpeechServiceImpl).rate(0.5);
      await _textToSpeechService
          .speak(text)
          .then((value) => Future.delayed(const Duration(seconds: 1)))
          .then((value) {
        emit(state.copyWith(isSpeaking: false));
      });
    }
  }

  void stop() async {
    await _textToSpeechService.stop();
    emit(state.copyWith(isSpeaking: false));
  }

  void updateSpeakingMessageAmount(int amount) =>
      emit(state.copyWith(speakingMessageAmount: amount));

  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  updateState(TextToSpeechState Function(TextToSpeechState) onUpdate) =>
      emit(onUpdate(state));
}
