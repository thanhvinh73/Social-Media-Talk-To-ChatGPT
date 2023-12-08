import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_with_chatgpt/screens/chat_bot_screen/cubit/chat_bot_screen_cubit.dart';

import '../../../models/message/message.dart';
import '../../../public_providers/google_speech_cubit/google_speech_cubit.dart';
import '../../../shared/widgets/animations/loading_animation.dart';

class ChatBubbleWidget extends StatelessWidget {
  final Message currentMessage;
  final double? maxWidth;
  final Alignment? openAiMessageAlignment;
  final Alignment? messageAligment;
  final Color? openAiMessageColor;
  final Color? messageColor;
  final TextStyle? openAiMessageTextStyle;
  final TextStyle? messageTextStyle;
  final BorderRadius? openAiMessageBorderRadius;
  final BorderRadius? messageBorderRadius;

  const ChatBubbleWidget({
    super.key,
    required this.currentMessage,
    this.openAiMessageAlignment,
    this.messageAligment,
    this.openAiMessageColor,
    this.messageColor,
    this.messageTextStyle,
    this.openAiMessageTextStyle,
    this.openAiMessageBorderRadius,
    this.messageBorderRadius,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return (!currentMessage.isDone)
        ? Align(
            alignment: currentMessage.isSentByMe
                ? messageAligment ?? Alignment.centerLeft
                : openAiMessageAlignment ?? Alignment.centerRight,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: maxWidth ?? double.infinity),
              child: Card(
                  margin: const EdgeInsets.only(bottom: 8, top: 8),
                  color: currentMessage.isSentByMe
                      ? messageColor ?? const Color(0xFFCFFDE1)
                      : openAiMessageColor ?? Colors.white,
                  elevation: 3,
                  shape: currentMessage.isSentByMe
                      ? ContinuousRectangleBorder(
                          borderRadius: messageBorderRadius ??
                              const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25)))
                      : ContinuousRectangleBorder(
                          borderRadius: openAiMessageBorderRadius ??
                              const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: currentMessage.isSentByMe
                          ? BlocBuilder<GoogleSpeechCubit, GoogleSpeechState>(
                              buildWhen: (previous, current) =>
                                  previous.finalReconizerText !=
                                      current.finalReconizerText ||
                                  previous.currentReconizerText !=
                                      current.currentReconizerText,
                              builder: (context, state) {
                                return Text(
                                  "${state.finalReconizerText}${state.currentReconizerText}",
                                  style: messageTextStyle ??
                                      const TextStyle(
                                          color: Colors.black87, fontSize: 18),
                                );
                              },
                            )
                          : const SizedBox(
                              height: 50,
                              width: 65,
                              child:
                                  LoadingAnimation(color: Color(0xFF08875D))))),
            ))
        : Align(
            alignment: currentMessage.isSentByMe
                ? messageAligment ?? Alignment.centerLeft
                : openAiMessageAlignment ?? Alignment.centerRight,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: maxWidth ?? double.infinity),
              child: Stack(
                children: [
                  Card(
                      margin: EdgeInsets.only(
                          bottom: 8,
                          top: 8,
                          left: !currentMessage.isSentByMe ? 26 : 0),
                      color: currentMessage.isSentByMe
                          ? messageColor ?? const Color(0xFFCFFDE1)
                          : openAiMessageColor ?? Colors.white,
                      elevation: 3,
                      shape: currentMessage.isSentByMe
                          ? ContinuousRectangleBorder(
                              borderRadius: messageBorderRadius ??
                                  const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25)))
                          : ContinuousRectangleBorder(
                              borderRadius: openAiMessageBorderRadius ??
                                  const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: currentMessage.isSentByMe
                              ? Text("${currentMessage.message}",
                                  style: messageTextStyle ??
                                      const TextStyle(
                                          color: Colors.black87, fontSize: 18))
                              : currentMessage.isGenerating
                                  ? AnimatedTextKit(
                                      animatedTexts: [
                                        TyperAnimatedText(
                                            "${currentMessage.message}",
                                            speed: const Duration(
                                                milliseconds: 20),
                                            textStyle: openAiMessageTextStyle ??
                                                const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 18))
                                      ],
                                      displayFullTextOnTap: false,
                                      repeatForever: false,
                                      totalRepeatCount: 1,
                                      onFinished: () {
                                        context
                                            .read<ChatBotScreenCubit>()
                                            .updateNewMessage(currentMessage
                                                .copyWith(isGenerating: false));
                                      },
                                    )
                                  : Text("${currentMessage.message}",
                                      style: openAiMessageTextStyle ??
                                          const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18)))),
                  !currentMessage.isSentByMe
                      ? Positioned(
                          left: 0,
                          top: 16,
                          child: GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                      text: currentMessage.message ?? ""))
                                  .then((value) {
                                const snackBar = SnackBar(
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xFF08875D),
                                  showCloseIcon: true,
                                  content: Text(
                                    'コピーに成功しました',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              });
                            },
                            child: SvgPicture.asset(
                              "assets/icons/ic_copy.svg",
                              color: Colors.grey,
                              height: 20,
                              width: 20,
                            ),
                          ))
                      : const SizedBox.shrink()
                ],
              ),
            ));
  }
}
