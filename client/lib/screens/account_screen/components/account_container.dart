import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';

class AccountContainer extends StatelessWidget {
  const AccountContainer({
    super.key,
    required this.child,
    this.backgroundColor = AppColors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.width,
  });
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: width,
      color: backgroundColor,
      padding: padding,
      child: child,
    );
  }
}
