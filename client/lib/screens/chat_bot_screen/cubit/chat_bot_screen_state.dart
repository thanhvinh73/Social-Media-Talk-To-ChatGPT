part of 'chat_bot_screen_cubit.dart';

@freezed
class ChatBotScreenState with _$ChatBotScreenState {
  const factory ChatBotScreenState.initial({
    @Default([]) List<Message> savedTextList,
    String? errorMessage,
    @Default(true) bool? needScroll,
    Message? currentAskMessage,
    @Default([]) List<Message> askMessageList,
    @Default([]) List<Message> openAiMessageList,
    @Default(0) int currentAskAmount,
    @Default(0) int speakingMessageAmount,
    @Default(5) int maxLengthAskList,
  }) = _Initial;
}
