import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/translations.g.dart';

enum BottomTabs { Home }

extension BottomTabsExt on BottomTabs {
  IconData get icon => {
        BottomTabs.Home: Icons.home_filled,
      }[this]!;

  String get label => {
        BottomTabs.Home: tr(LocaleKeys.App_Home),
      }[this]!;
  Widget? action(BuildContext context) {
    return {
      BottomTabs.Home: null,
    }[this];
  }
}
