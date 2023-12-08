import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/services/recorder_service/i_recorder_service.dart';
import '../../services/services/recorder_service/recorder_service_impl.dart';

part 'recorder_state.dart';
part 'recorder_cubit.freezed.dart';

class RecorderCubit extends Cubit<RecorderState> {
  RecorderCubit() : super(const RecorderState()) {
    _recorderService.openRecorder();
    _recorderService.openPlayer();
    emit(state.copyWith(recorderIsInited: true, playerIsInited: true));
  }

  final IRecorderService _recorderService = RecorderServiceImpl();

  void record() async {
    emit(state.copyWith(isListening: true, timeCounting: false));
    await Future.delayed(const Duration(microseconds: 100), () {
      emit(state.copyWith(timeCounting: true));
    });

    StreamController<List<int>> recordingDataRecognitionController =
        StreamController<List<int>>();
    recordingDataRecognitionController.stream.asBroadcastStream();
    emit(state.copyWith(
      recordingDataRecognitionController: recordingDataRecognitionController,
    ));
    _recorderService.record(
        recordingDataRecognitionController: recordingDataRecognitionController);
  }

  void stopRecorder() {
    _recorderService.stopRecorder();
    emit(state.copyWith(
        playbackReady: true,
        isListening: false,
        timeCounting: false,
        recordingDataRecognitionController: null));
  }

  void play() async {
    emit(state.copyWith(isPlaying: true));
    await _recorderService.startPlayer();
    emit(state.copyWith(isPlaying: false));
  }

  void stopPlayer() async {
    await _recorderService.startPlayer();
    emit(state.copyWith(isPlaying: false));
  }

  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  updateState(RecorderState Function(RecorderState) onUpdate) =>
      emit(onUpdate(state));
}
