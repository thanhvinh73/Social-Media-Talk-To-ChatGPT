import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppText("Hello from conversation screen"),
    );
  }
}
