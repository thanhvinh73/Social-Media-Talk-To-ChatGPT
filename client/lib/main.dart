import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/page/onboarding-screen.dart';

void main() {
  runApp(SocialScape());
}

class SocialScape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: OnboardingScreen(),
      )
    );
  }
}


