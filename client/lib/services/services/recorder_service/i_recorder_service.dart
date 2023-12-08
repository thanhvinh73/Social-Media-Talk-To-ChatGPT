import 'dart:async';
import 'dart:io';

abstract class IRecorderService {
  void openRecorder();
  void openPlayer();
  Future<IOSink> createFile({String fileName});
  void record(
      {StreamController<List<int>>? recordingDataRecognitionController});
  void stopRecorder();
  Future startPlayer();
  Future stopPlayer();
}
