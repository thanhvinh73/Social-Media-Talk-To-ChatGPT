part of 'openai_cubit.dart';

@freezed
class OpenaiState with _$OpenaiState {
  const factory OpenaiState({
    String? errorMessage,
    String? currentOpenAiText,
    @Default(false) bool? isGenerating,
    Message? currentOpenAiMessage,
  }) = _Initial;
}
