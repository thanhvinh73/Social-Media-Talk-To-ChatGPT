abstract class ITextToSpeechService {
  Future speak(String text);
  Future stop();
  Future pause();
}
