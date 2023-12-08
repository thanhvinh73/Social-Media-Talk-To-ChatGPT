import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_with_chatgpt/screens/chat_bot_screen/cubit/chat_bot_screen_cubit.dart';

import '../../../public_providers/recorder_cubit/recorder_cubit.dart';

class BottomMicWidget extends StatelessWidget {
  const BottomMicWidget({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.iconMic,
    this.iconOffMic,
    this.iconStop,
    required this.onMic,
    required this.onStop,
  });
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData? iconMic;
  final IconData? iconOffMic;
  final IconData? iconStop;
  final void Function() onMic;
  final void Function() onStop;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<RecorderCubit, RecorderState>(
            buildWhen: (previous, current) =>
                previous.isListening != current.isListening ||
                previous.timeCounting != current.timeCounting,
            builder: (context, state) {
              if (state.isListening != true) {
                return const SizedBox.shrink();
              } else {
                return LayoutBuilder(
                  builder: (context, constraint) => Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    decoration: const BoxDecoration(color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/voice-no-background.png',
                          color: Colors.green,
                        ),
                        Positioned.fill(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedContainer(
                                width: state.timeCounting == true
                                    ? 0
                                    : constraint.maxWidth / 1.2,
                                height: double.infinity,
                                duration: const Duration(milliseconds: 10000),
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
        BlocBuilder<ChatBotScreenCubit, ChatBotScreenState>(
          builder: (context, mainChatScreenState) {
            return BlocBuilder<RecorderCubit, RecorderState>(
              builder: (context, recorderState) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 9,
                            color: Colors.black38,
                            // spreadRadius: 1,
                            offset: Offset(4, 4)),
                      ],
                      shape: BoxShape.circle,
                      color: backgroundColor ?? const Color(0xFF68B984)),
                  alignment: Alignment.center,
                  child: (recorderState.isListening != true &&
                          mainChatScreenState.currentAskAmount <
                              mainChatScreenState.maxLengthAskList)
                      ? IconButton(
                          icon: Icon(
                            iconMic ?? Icons.mic_none_outlined,
                            color: iconColor ?? Colors.white,
                            // size: 40,
                          ),
                          onPressed: onMic,
                        )
                      : (mainChatScreenState.currentAskAmount ==
                              mainChatScreenState.maxLengthAskList)
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                iconOffMic ?? Icons.mic_off_outlined,
                                color: iconColor ?? Colors.white,
                                // size: 40,
                              ),
                            )
                          : IconButton(
                              icon: Icon(
                                iconStop ?? Icons.stop,
                                color: iconColor ?? Colors.white,
                                // size: 40,
                              ),
                              onPressed: onStop,
                            ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
