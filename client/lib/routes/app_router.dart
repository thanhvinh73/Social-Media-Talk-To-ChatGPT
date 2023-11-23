import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/screens/login_screen/login_screen.dart';
import 'package:social_media_with_chatgpt/screens/onboarding_screen/onboarding_screen.dart';
import 'package:social_media_with_chatgpt/screens/register_screen/register_screen.dart';

import '../screens/connect_to_server_screen/connect_to_server_screen.dart';
import '../screens/main_screen/main_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

class Routes {
  static String splash = "/splash";
  static String connectToServer = "/connect-to-server";
  static String main = "/main";
  static String login = "/login";
  static String register = "/register";
  static String welcome = "/wecome";

  static final Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => SplashScreen(),
    connectToServer: (context) => ConnectToServerScreen(),
    main: (context) => const MainScreen(),
    login: (context) => LoginScreen(),
    register: (context) => RegisterScreen(),
    welcome: (context) => OnboardingScreen()
  };
}
