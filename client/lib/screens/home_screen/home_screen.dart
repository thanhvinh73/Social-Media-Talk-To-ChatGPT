import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText("Hello from home screen"),
    );
  }
}
