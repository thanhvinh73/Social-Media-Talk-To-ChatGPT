import 'dart:async';
import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logger/logger.dart';

import 'i_recorder_service.dart';

class RecorderServiceImpl implements IRecorderService {
  final FlutterSoundRecorder _recorder =
      FlutterSoundRecorder(logLevel: Level.nothing);
  final FlutterSoundPlayer _player =
      FlutterSoundPlayer(logLevel: Level.nothing);
  StreamSubscription? _recordingDataSubscription;
  String? _filePath;

  String? get filePath => _filePath;

  @override
  void openRecorder() async {
    if (Platform.isAndroid) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw Exception("Application cannot access microphone");
      }
    }

    await _recorder.openRecorder();

    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
        avAudioSessionCategoryOptions:
            AVAudioSessionCategoryOptions.allowBluetooth |
                AVAudioSessionCategoryOptions.defaultToSpeaker,
        avAudioSessionMode: AVAudioSessionMode.spokenAudio,
        avAudioSessionRouteSharingPolicy:
            AVAudioSessionRouteSharingPolicy.defaultPolicy,
        avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
        androidAudioAttributes: const AndroidAudioAttributes(
            contentType: AndroidAudioContentType.speech,
            flags: AndroidAudioFlags.none,
            usage: AndroidAudioUsage.voiceCommunication),
        androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
        androidWillPauseWhenDucked: true));
  }

  @override
  void openPlayer() async {
    await _player.openPlayer();
  }

  @override
  Future<IOSink> createFile(
      {String fileName = "flutter_sound_example.pcm"}) async {
    Directory tempDir = await getTemporaryDirectory();
    _filePath = '${tempDir.path}/$fileName';
    File outputFile = File(_filePath!);
    if (outputFile.existsSync()) {
      await outputFile.delete();
    }
    return outputFile.openWrite();
  }

  @override
  void record(
      {StreamController<List<int>>? recordingDataRecognitionController}) async {
    var sink = await createFile();
    var recordingDataController = StreamController<Food>();
    _recordingDataSubscription =
        recordingDataController.stream.listen((buffer) {
      if (buffer is FoodData && buffer.data != null) {
        sink.add(buffer.data!);
        if (recordingDataRecognitionController != null) {
          recordingDataRecognitionController.add(buffer.data!.toList());
        }
      }
    });

    await _recorder.startRecorder(
        toStream: recordingDataController.sink,
        codec: Codec.pcm16,
        numChannels: 1,
        sampleRate: 48000,
        bitRate: 48000);
  }

  @override
  void stopRecorder() async {
    await _recorder.stopRecorder();
    if (_recordingDataSubscription != null) {
      await _recordingDataSubscription!.cancel();
      _recordingDataSubscription = null;
    }
  }

  @override
  Future startPlayer() {
    return _player.startPlayer(
        fromURI: filePath,
        sampleRate: 48000,
        codec: Codec.pcm16,
        numChannels: 1,
        whenFinished: () {});
  }

  @override
  Future stopPlayer() {
    return _player.stopPlayer();
  }
}
