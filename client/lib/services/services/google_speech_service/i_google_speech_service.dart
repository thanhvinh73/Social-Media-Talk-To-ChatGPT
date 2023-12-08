import 'dart:async';

import 'package:google_speech/generated/google/cloud/speech/v1/cloud_speech.pb.dart'
    show StreamingRecognizeResponse;

abstract class IGoogleSpeechService {
  Stream<StreamingRecognizeResponse> getRecognizeStream(
      StreamController<List<int>> audioStreamController);
  Future<Stream<StreamingRecognizeResponse>> getRecognizeStreamFromAudioFile(
      String fileName);
}
