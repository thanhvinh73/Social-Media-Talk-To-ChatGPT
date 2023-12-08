part of 'text_to_speech_cubit.dart';

@freezed
class TextToSpeechState with _$TextToSpeechState {
  const factory TextToSpeechState(
      {String? errorMessage,
      @Default(false) bool? isSpeaking,
      @Default(0) int speakingMessageAmount}) = _Initial;
}
