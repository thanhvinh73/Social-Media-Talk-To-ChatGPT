import 'package:dart_openai/dart_openai.dart';

abstract class IOpenAiService {
  Future<OpenAIChatCompletionModel> createChat(String? message);
  Stream<OpenAIStreamChatCompletionModel> createChatStream(String? message);
}
