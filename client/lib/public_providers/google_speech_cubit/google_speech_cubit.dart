import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_speech/generated/google/cloud/speech/v1/cloud_speech.pb.dart'
    show StreamingRecognizeResponse;

import '../../models/message/message.dart';
import '../../services/services/google_speech_service/google_speech_service_impl.dart';
import '../../services/services/google_speech_service/i_google_speech_service.dart';

part 'google_speech_state.dart';
part 'google_speech_cubit.freezed.dart';

class GoogleSpeechCubit extends Cubit<GoogleSpeechState> {
  GoogleSpeechCubit() : super(const GoogleSpeechState());

  final IGoogleSpeechService _googleSpeechService = GoogleSpeechServiceImpl(
      assetPath: 'assets/com-tan-5f0885096433.json', languageCode: "vi-Vn");
  StreamSubscription? _recognizeStreamSubscription;
  Stream<StreamingRecognizeResponse>? _recognizeStream;
  void recognize() {
    if (state.recordingDataRecognitionController != null) {
      emit(state.copyWith(isRecognizing: true));
      // emit(state.copyWith(
      //     finalReconizerText: "Công thức nấu món gà chiên mắm.",
      //     isFinalReconizerText: true));
      // emit(state.copyWith(
      //     finalReconizerText: "Việt nam có bao nhiêu tỉnh?",
      //     isFinalReconizerText: true));

      _recognizeStream = _googleSpeechService
          .getRecognizeStream(state.recordingDataRecognitionController!);
      _recognizeStreamSubscription = _recognizeStream!.listen((data) {
        if (data.results.isNotEmpty) {
          String recognizedText =
              data.results.first.alternatives.first.transcript;

          Timer(const Duration(seconds: 2), () {
            if (state.checkChangeReconizerText == recognizedText) {
              emit(state.copyWith(isRecognizing: false));
            }
          });

          debugPrint("check recognizedText: |$recognizedText");
          debugPrint("Check result's isFinal: ${data.results.first.isFinal}");

          if (data.results.first.isFinal) {
            emit(state.copyWith(
                finalReconizerText: state.finalReconizerText + recognizedText,
                currentReconizerText: "",
                isFinalReconizerText: true));
          } else {
            emit(state.copyWith(
                currentReconizerText: recognizedText,
                isFinalReconizerText: false));
          }
          emit(state.copyWith(checkChangeReconizerText: recognizedText));
        }
      });
    }
  }

  void cancelRecognize() async {
    if (_recognizeStreamSubscription != null) {
      await _recognizeStreamSubscription!.cancel();
      _recognizeStreamSubscription = null;
    }
    emit(state.copyWith(isRecognizing: false));
  }

  void updateCurrentListeningMessage({Message? message, required bool isDone}) {
    if (isDone && state.currentListeningMessage != null) {
      emit(state.copyWith(
        currentListeningMessage: state.currentListeningMessage!
            .copyWith(message: state.finalReconizerText, isDone: true),
        currentReconizerText: "",
        checkChangeReconizerText: "",
        finalReconizerText: "",
      ));
    } else {
      emit(state.copyWith(
        currentListeningMessage: message,
      ));
    }
  }

  void updateRecordingDataRecognitionController(
          StreamController<List<int>>? controller) =>
      emit(state.copyWith(recordingDataRecognitionController: controller));

  void updateFinalReconizerText(String text) =>
      emit(state.copyWith(finalReconizerText: text));
  void updateIsFinalReconizerText(bool isFinal) =>
      emit(state.copyWith(isFinalReconizerText: isFinal));

  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  updateState(GoogleSpeechState Function(GoogleSpeechState) onUpdate) =>
      emit(onUpdate(state));
}
