import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:google_speech/generated/google/cloud/speech/v1/cloud_speech.pb.dart'
    show StreamingRecognizeResponse;
import 'package:google_speech/google_speech.dart';
import 'package:path_provider/path_provider.dart';

import 'i_google_speech_service.dart';

class GoogleSpeechServiceImpl implements IGoogleSpeechService {
  String languageCode;
  GoogleSpeechServiceImpl(
      {required String assetPath, required this.languageCode}) {
    _config = RecognitionConfig(
        encoding: AudioEncoding.LINEAR16,
        model: RecognitionModel.basic,
        enableAutomaticPunctuation: false,
        sampleRateHertz: 48000,
        enableWordTimeOffsets: false,
        maxAlternatives: 1,
        profanityFilter: false,
        useEnhanced: false,
        languageCode: languageCode);
    _streamingRecognitionConfig = StreamingRecognitionConfig(
        config: _config, interimResults: true, singleUtterance: false);
    _initGoogleService(assetPath);
  }

  late final RecognitionConfig _config;
  late final StreamingRecognitionConfig _streamingRecognitionConfig;
  late final ServiceAccount _serviceAccount;
  late final SpeechToText _speechToText;
  late StreamController<List<int>> audioStreamController =
      StreamController<List<int>>();

  Future<void> _initGoogleService(String assetPath) async {
    String serviceAccountJson = await rootBundle.loadString(assetPath);
    _serviceAccount = ServiceAccount.fromString(serviceAccountJson);
    _speechToText = SpeechToText.viaServiceAccount(_serviceAccount);
  }

  Future<Stream<List<int>>> _getAudioStream(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = "${directory.path}/$fileName";
    return File(path).openRead();
  }

  @override
  Stream<StreamingRecognizeResponse> getRecognizeStream(
      StreamController<List<int>> audioStreamController) {
    this.audioStreamController = audioStreamController;
    return _speechToText.streamingRecognize(
        _streamingRecognitionConfig, audioStreamController.stream);
  }

  @override
  Future<Stream<StreamingRecognizeResponse>> getRecognizeStreamFromAudioFile(
      String fileName) async {
    final audio = await _getAudioStream(fileName);
    return _speechToText.streamingRecognize(_streamingRecognitionConfig, audio);
  }
}
