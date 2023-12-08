import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';

import '../../models/message/message.dart';
import '../../public_providers/google_speech_cubit/google_speech_cubit.dart';
import '../../public_providers/openai_cubit/openai_cubit.dart';
import '../../public_providers/recorder_cubit/recorder_cubit.dart';
import '../../public_providers/text_to_speech_cubit/text_to_speech_cubit.dart';
import 'components/bottom_mic_widget.dart';
import 'components/chat_bubble_widget.dart';
import 'cubit/chat_bot_screen_cubit.dart';

// ignore: must_be_immutable
class ChatBotScreen extends StatelessWidget {
  ChatBotScreen({super.key});
  final ScrollController _listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      onWillPop: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ChatBotScreenCubit()),
          BlocProvider(create: (context) => GoogleSpeechCubit()),
          BlocProvider(create: (context) => OpenaiCubit()),
          BlocProvider(create: (context) => RecorderCubit()),
          BlocProvider(create: (context) => TextToSpeechCubit()),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<OpenaiCubit, OpenaiState>(
                listenWhen: (previous, current) =>
                    previous.errorMessage != current.errorMessage &&
                    current.errorMessage != null,
                listener: (context, state) {
                  // Show OpenAi's error
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return Center(
                          child: AlertDialog(
                            surfaceTintColor: Colors.green,
                            alignment: Alignment.centerLeft,
                            title: const Text("エラー"),
                            content: Text("${state.errorMessage}"),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    context
                                        .read<OpenaiCubit>()
                                        .resetErrorMessage();
                                    Navigator.of(_).pop();
                                  },
                                  child: const Text("近い"))
                            ],
                          ),
                        );
                      });
                }),
            BlocListener<OpenaiCubit, OpenaiState>(
              listenWhen: (previous, current) {
                return previous.isGenerating != current.isGenerating;
              },
              listener: (context, state) {
                if (!state.isGenerating! && state.currentOpenAiText != null) {
                  // Check currentOpenAiText and update isDone currentOpenAiMessage
                  debugPrint(
                      "Check current openAi's text: ${state.currentOpenAiText}");
                  context
                      .read<OpenaiCubit>()
                      .updateCurrentOpenAiMessage(isDone: true);
                  // context
                  //     .read<OpenaiCubit>()
                  //     .updateCurrentOpenAiMessageNotGenerating();
                } else if (state.isGenerating!) {
                  // Add new message to savedList when having a new open ai message
                  Message newMessage =
                      context.read<ChatBotScreenCubit>().addNewMessage(false);
                  context.read<OpenaiCubit>().updateCurrentOpenAiMessage(
                      message: newMessage, isDone: false);
                }
              },
            ),
            BlocListener<OpenaiCubit, OpenaiState>(
              listenWhen: (previous, current) =>
                  previous.currentOpenAiMessage !=
                      current.currentOpenAiMessage &&
                  current.currentOpenAiMessage != null,
              listener: (context, state) {
                // Update savedList when current open ai message has status is done
                if (state.currentOpenAiMessage!.isDone) {
                  Message? message = context
                      .read<ChatBotScreenCubit>()
                      .updateNewMessage(state.currentOpenAiMessage!);
                  if (message != null && message.message != "") {
                    context
                        .read<ChatBotScreenCubit>()
                        .updateOpenAiMessageList(message: message, isAdd: true);
                  }
                  context
                      .read<OpenaiCubit>()
                      .updateCurrentOpenAiMessage(isDone: false);
                }

                // else if (!state.currentOpenAiMessage!.isGenerating) {
                //   context
                //       .read<ChatBotScreenCubit>()
                //       .updateNewMessage(state.currentOpenAiMessage!);
                // }
              },
            ),
            BlocListener<GoogleSpeechCubit, GoogleSpeechState>(
              listenWhen: (previous, current) =>
                  previous.recordingDataRecognitionController !=
                  current.recordingDataRecognitionController,
              listener: (context, state) {
                // Add new message to savedList when having a new recordingDataRecognitionController
                if (state.recordingDataRecognitionController != null) {
                  context.read<GoogleSpeechCubit>().recognize();
                  final newMessage =
                      context.read<ChatBotScreenCubit>().addNewMessage(true);
                  context
                      .read<GoogleSpeechCubit>()
                      .updateCurrentListeningMessage(
                          message: newMessage, isDone: false);
                }
              },
            ),
            BlocListener<GoogleSpeechCubit, GoogleSpeechState>(
              listenWhen: (previous, current) =>
                  previous.currentListeningMessage !=
                      current.currentListeningMessage &&
                  current.currentListeningMessage != null,
              listener: (context, state) {
                // Update savedList when currentListeningMessage has status is done
                if (state.currentListeningMessage!.isDone) {
                  Message? message = context
                      .read<ChatBotScreenCubit>()
                      .updateNewMessage(state.currentListeningMessage!);

                  // Add new message to AskMessageList if the right at the moment, a openAiMessage is generating
                  if (context.read<OpenaiCubit>().state.isGenerating! &&
                      message != null &&
                      message.message != "") {
                    context
                        .read<ChatBotScreenCubit>()
                        .updateAskMessageList(message: message, isAdd: true);
                  }

                  // Reset currentListeningMessage
                  context
                      .read<GoogleSpeechCubit>()
                      .updateCurrentListeningMessage(isDone: false);
                }
              },
            ),
            BlocListener<GoogleSpeechCubit, GoogleSpeechState>(
              listenWhen: (previous, current) =>
                  previous.isRecognizing != current.isRecognizing,
              listener: (context, state) {
                if (!state.isRecognizing) {
                  // Stop recorder
                  if (context.read<RecorderCubit>().state.isListening) {
                    print("stop recorder");
                    context.read<RecorderCubit>().stopRecorder();
                  }

                  if (state.currentListeningMessage != null) {
                    // Update finalReconizerText
                    if (!state.isFinalReconizerText) {
                      context
                          .read<GoogleSpeechCubit>()
                          .updateFinalReconizerText(state.finalReconizerText +
                              state.currentReconizerText);
                      context
                          .read<GoogleSpeechCubit>()
                          .updateIsFinalReconizerText(true);
                    }
                    // Update currentListeningMessage's status is DONE!
                    context
                        .read<GoogleSpeechCubit>()
                        .updateCurrentListeningMessage(isDone: true);
                  }
                }
              },
            ),
            BlocListener<TextToSpeechCubit, TextToSpeechState>(
              listenWhen: (previous, current) =>
                  previous.isSpeaking != current.isSpeaking,
              listener: (context, state) {
                if (!state.isSpeaking!) {
                  // Open recorder
                  if (!context.read<RecorderCubit>().state.isListening) {
                    context.read<RecorderCubit>().record();
                  }

                  context
                      .read<ChatBotScreenCubit>()
                      .updateOpenAiMessageList(isAdd: false);
                }
              },
            ),
            BlocListener<RecorderCubit, RecorderState>(
              listenWhen: (previous, current) =>
                  (previous.isListening != current.isListening) ||
                  (previous.recordingDataRecognitionController !=
                      current.recordingDataRecognitionController),
              listener: (context, state) {
                if (state.isListening) {
                  if (state.recordingDataRecognitionController != null) {
                    context
                        .read<GoogleSpeechCubit>()
                        .updateRecordingDataRecognitionController(
                            state.recordingDataRecognitionController);
                  }
                } else {
                  context.read<GoogleSpeechCubit>().cancelRecognize();
                }
              },
            ),
            BlocListener<ChatBotScreenCubit, ChatBotScreenState>(
              listenWhen: (previous, current) =>
                  previous.openAiMessageList != current.openAiMessageList,
              listener: (context, state) {
                if (state.openAiMessageList.isNotEmpty &&
                    !context.read<TextToSpeechCubit>().state.isSpeaking!) {
                  context
                      .read<TextToSpeechCubit>()
                      .speak(state.openAiMessageList.first.message!);
                }
              },
            ),
            BlocListener<ChatBotScreenCubit, ChatBotScreenState>(
              listenWhen: (previous, current) =>
                  previous.savedTextList != current.savedTextList,
              listener: (context, state) {
                if (!context.read<OpenaiCubit>().state.isGenerating!) {
                  if (state.currentAskAmount > 0) {
                    context
                        .read<ChatBotScreenCubit>()
                        .updateAskMessageList(isAdd: false);
                    context
                        .read<OpenaiCubit>()
                        .requestOpenAi(state.askMessageList.first.message!);
                  } else if (state.savedTextList.isNotEmpty &&
                      state.savedTextList.last.isSentByMe &&
                      state.savedTextList.last.isDone) {
                    context
                        .read<OpenaiCubit>()
                        .requestOpenAi(state.savedTextList.last.message!);
                  }
                }
              },
            ),
            BlocListener<ChatBotScreenCubit, ChatBotScreenState>(
              listener: (context, state) async {
                if (state.needScroll == true &&
                    state.savedTextList.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _listScrollController.animateTo(
                        _listScrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  });
                  context.read<ChatBotScreenCubit>().updateNeedScroll(false);
                }
              },
            ),
          ],
          child: LayoutBuilder(builder: (context, constraints) {
            return AppLayout(
              backgroundColor: AppColors.white,
              onWillPop: () => Future.value(true),
              useSafeArea: true,
              child: BlocBuilder<ChatBotScreenCubit, ChatBotScreenState>(
                buildWhen: (previous, current) =>
                    previous.savedTextList != current.savedTextList ||
                    (previous.needScroll != current.needScroll &&
                        current.needScroll!),
                builder: (context, state) {
                  // print(
                  //     "Check list change -------------------------------------------- ${state.savedTextList.length}");
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom),
                    child: Column(children: [
                      state.savedTextList.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  controller: _listScrollController,
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  itemCount: state.savedTextList.length,
                                  itemBuilder: (context, index) {
                                    return ChatBubbleWidget(
                                      maxWidth:
                                          MediaQuery.of(context).size.width -
                                              60,
                                      currentMessage:
                                          state.savedTextList[index],
                                      messageColor: const Color(0xFFCFFDE1),
                                      openAiMessageColor: Colors.white,
                                    );
                                  }))
                          : Expanded(
                              child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 28),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/ic_chatBot.svg",
                                      color: const Color(0xFF68B984),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "AI ASSISTANT",
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      BottomMicWidget(
                          backgroundColor: const Color(0xFF08875D),
                          iconColor: Colors.white,
                          onMic: () => context.read<RecorderCubit>().record(),
                          onStop: () =>
                              context.read<RecorderCubit>().stopRecorder())
                    ]),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
