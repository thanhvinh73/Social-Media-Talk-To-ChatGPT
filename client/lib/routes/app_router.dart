import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/screens/account_screen/account_screen.dart';
import 'package:social_media_with_chatgpt/screens/chat_bot_screen/chat_bot_screen.dart';
import 'package:social_media_with_chatgpt/screens/comment_screen/comment_screen.dart';
import 'package:social_media_with_chatgpt/screens/create_post_screen/create_post_screen.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/home_screen.dart';
import 'package:social_media_with_chatgpt/screens/login_screen/login_screen.dart';
import 'package:social_media_with_chatgpt/screens/onboarding_screen/onboarding_screen.dart';
import 'package:social_media_with_chatgpt/screens/photo_view_screen/photo_view_screen.dart';
import 'package:social_media_with_chatgpt/screens/register_screen/register_screen.dart';
import 'package:social_media_with_chatgpt/screens/update_profile_screen/update_profile_screen.dart';

import '../screens/connect_to_server_screen/connect_to_server_screen.dart';
import '../screens/main_screen/main_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

class Routes {
  static String splash = "/splash";
  static String connectToServer = "/connect-to-server";
  static String main = "/main";
  static String login = "/login";
  static String register = "/register";
  static String welcome = "/welcome";
  static String chatBot = "/chat-bot";
  static String home = "/home";
  static String updateProfile = "/update-profile";
  static String account = "/account";
  static String photoGallery = "/photo-gallery";
  static String createPost = "/create-post";
  static String comment = "/comment";

  static final Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => SplashScreen(),
    connectToServer: (context) => ConnectToServerScreen(),
    main: (context) => const MainScreen(),
    login: (context) => LoginScreen(),
    register: (context) => RegisterScreen(),
    welcome: (context) => OnboardingScreen(),
    chatBot: (context) => ChatBotScreen(),
    home: (context) => const HomeScreen(),
    account: (context) => const AccountScreen(),
    updateProfile: (context) => UpdateProfileScreen(),
    photoGallery: (context) {
      List<dynamic> arr =
          ModalRoute.of(context)?.settings.arguments as List<dynamic>;
      return PhotoViewScreen(urls: arr[0], initIndex: arr[1]);
    },
    createPost: (context) {
      Post? post = ModalRoute.of(context)?.settings.arguments as Post?;
      return CreatePostScreen(post: post);
    },
    comment: (context) {
      Post post = ModalRoute.of(context)?.settings.arguments as Post;
      return CommentScreen(post: post);
    }
  };
}
