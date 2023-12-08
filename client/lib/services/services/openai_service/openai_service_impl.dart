import 'package:dart_openai/dart_openai.dart';

import 'i_openai_service.dart';

class OpenAiServiceImpl implements IOpenAiService {
  OpenAI instance = OpenAI.instance;
  String? modelVersion = "gpt-3.5-turbo";
  int? maxToken = 1000;
  double? temperature = 0.8;
  int? chatCompletionChoiceAmount = 1;
  List<String>? stopBy = [];

  OpenAiServiceImpl(
      {this.modelVersion,
      this.maxToken,
      this.temperature,
      this.chatCompletionChoiceAmount,
      this.stopBy});

  set setModelVersion(String modelVersion) => this.modelVersion = modelVersion;
  set setMaxToken(int? maxToken) => this.maxToken = maxToken;
  set setTemperature(double? temperature) => this.temperature = temperature;
  set setChatCompletionChoiceAmount(int? amount) =>
      chatCompletionChoiceAmount = amount;
  set setStopBy(List<String> stopBy) => this.stopBy = stopBy;

  @override
  Future<OpenAIChatCompletionModel> createChat(String? message) {
    try {
      return instance.chat.create(
        model: modelVersion ?? "gpt-3.5-turbo",
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
              content: message ?? "", role: OpenAIChatMessageRole.user)
        ],
        maxTokens: maxToken,
        temperature: temperature,
        n: chatCompletionChoiceAmount,
        stop: stopBy,
      );
    } on RequestFailedException {
      rethrow;
    }
  }

  @override
  Stream<OpenAIStreamChatCompletionModel> createChatStream(String? message) {
    try {
      return instance.chat.createStream(
          model: modelVersion ?? "gpt-3.5-turbo",
          messages: [
            OpenAIChatCompletionChoiceMessageModel(
                content: message ?? "", role: OpenAIChatMessageRole.user)
          ],
          maxTokens: maxToken,
          stop: stopBy,
          temperature: temperature,
          n: chatCompletionChoiceAmount);
    } on RequestFailedException {
      rethrow;
    }
  }
}
