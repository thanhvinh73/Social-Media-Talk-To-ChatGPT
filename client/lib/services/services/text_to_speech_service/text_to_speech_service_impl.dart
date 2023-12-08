// ignore_for_file: unused_field

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'i_text_to_speech_service.dart';

//For VietNamese: 'vi-VN'
//For Japanese: 'ja-JP'

class TextToSpeechServiceImpl implements ITextToSpeechService {
  late FlutterTts _flutterTts;
  late String _languageCode;
  late String _engine;
  double _volume = 0.5;
  double _pitch = 0.5;
  double _rate = 0.5;
  // TtsState _ttsState = TtsState.stopped;

  // get isPlaying => _ttsState == TtsState.playing;
  // get isStopped => _ttsState == TtsState.stopped;
  // get isPaused => _ttsState == TtsState.paused;
  // get isContinued => _ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  void languageCode(String languageCode) async {
    _languageCode = languageCode;
    _engine = languageCode;
    await _flutterTts.setLanguage(languageCode);
    await _flutterTts.setEngine(languageCode);
  }

  void volume(double volume) async {
    _volume = volume;
    await _flutterTts.setVolume(volume);
  }

  void pitch(double pitch) async {
    _pitch = pitch;
    await _flutterTts.setPitch(pitch);
  }

  void rate(double rate) async {
    _rate = rate;
    await _flutterTts.setSpeechRate(rate);
  }

  TextToSpeechServiceImpl({required String languageCode}) {
    _languageCode = languageCode;
    _engine = languageCode;
    _initTts();
  }

  @override
  Future speak(String text) {
    return _flutterTts.speak(text);
  }

  @override
  Future stop() {
    return _flutterTts.stop();
    // var result = await _flutterTts.stop();
    // if (result == 1) {
    //   _ttsState = TtsState.stopped;
    // }
  }

  @override
  Future pause() {
    return _flutterTts.pause();

    // var result = await _flutterTts.pause();
    // if (result == 1) {
    //   _ttsState = TtsState.paused;
    // }
  }

  void _initTts() {
    _flutterTts = FlutterTts();
    _setAwaitOptions();

    _flutterTts.setLanguage(_languageCode);
    _flutterTts.setEngine(_engine);

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
      _flutterTts.setInitHandler(() {});
    }

    // _flutterTts.setStartHandler(() {
    //   _ttsState = TtsState.playing;
    // });

    // _flutterTts.setCompletionHandler(() {
    //   _ttsState = TtsState.stopped;
    // });

    // _flutterTts.setCancelHandler(() {
    //   _ttsState = TtsState.stopped;
    // });

    // _flutterTts.setPauseHandler(() {
    //   _ttsState = TtsState.paused;
    // });

    // _flutterTts.setContinueHandler(() {
    //   _ttsState = TtsState.continued;
    // });

    // _flutterTts.setErrorHandler((msg) {
    //   _ttsState = TtsState.stopped;
    // });
  }

  void _setAwaitOptions() async {
    await _flutterTts.awaitSpeakCompletion(true);
  }

  void _getDefaultEngine() async {
    var engine = await _flutterTts.getDefaultEngine;
    if (engine != null) {
      debugPrint(engine);
    }
  }

  void _getDefaultVoice() async {
    var voice = await _flutterTts.getDefaultVoice;
    if (voice != null) {
      debugPrint(voice.toString());
    }
  }
}
