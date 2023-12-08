part of 'google_speech_cubit.dart';

@freezed
class GoogleSpeechState with _$GoogleSpeechState {
  const factory GoogleSpeechState(
      {String? errorMessage,
      @Default(false) bool isRecognizing,
      @Default("") String finalReconizerText,
      @Default(false) bool isFinalReconizerText,
      String? checkChangeReconizerText,
      @Default("") String currentReconizerText,
      StreamController<List<int>>? recordingDataRecognitionController,
      Message? currentListeningMessage}) = _Initial;
}
