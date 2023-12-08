import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/screens/account_screen/account_screen.dart';
import 'package:social_media_with_chatgpt/screens/conversation_screen/conversation_screen.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/home_screen.dart';
import 'package:social_media_with_chatgpt/screens/notification_screen/notification_screen.dart';

import '../../generated/translations.g.dart';

enum MainTabs { home, chat, notification, account }

extension MainTabsExt on MainTabs {
  IconData get icon => {
        MainTabs.home: Icons.home,
        MainTabs.chat: CupertinoIcons.chat_bubble_2_fill,
        MainTabs.account: Icons.account_circle,
        MainTabs.notification: Icons.notifications,
      }[this]!;

  String get label => {
        MainTabs.home: tr(LocaleKeys.App_Home),
        MainTabs.chat: "Chat",
        MainTabs.notification: "Notification",
        MainTabs.account: "Account",
      }[this]!;

  Widget get widget => {
        MainTabs.home: const HomeScreen(),
        MainTabs.chat: const ConversationScreen(),
        MainTabs.notification: const NotificationScreen(),
        MainTabs.account: const AccountScreen(),
      }[this]!;

  Widget? action(BuildContext context) {
    return {
      MainTabs.home: null,
      MainTabs.chat: null,
      MainTabs.notification: null,
      MainTabs.account: null,
    }[this];
  }
}
