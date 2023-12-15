import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_with_chatgpt/generated/translations.g.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text.dart';

class AccountProfileRowItem extends StatelessWidget {
  const AccountProfileRowItem({super.key, required this.icon, this.text});
  final IconData icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 28,
          color: AppColors.titleText,
        ),
        const SizedBox(width: 10),
        Expanded(
            child: AppText(
          text ?? tr(LocaleKeys.App_NotUpdate),
          color: AppColors.bodyText,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ))
      ],
    );
  }
}
