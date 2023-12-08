part of 'recorder_cubit.dart';

@freezed
class RecorderState with _$RecorderState {
  const factory RecorderState(
          {String? errorMessage,
          @Default(false) bool isListening,
          bool? timeCounting,
          @Default(false) bool playerIsInited,
          @Default(false) bool recorderIsInited,
          @Default(false) bool playbackReady,
          @Default(false) bool isPlaying,
          StreamController<List<int>>? recordingDataRecognitionController}) =
      _Initial;
}
