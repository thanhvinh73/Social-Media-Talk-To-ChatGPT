import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onTap,
    this.padding = EdgeInsets.zero,
    required this.icon,
    this.color,
    this.size,
  });
  final VoidCallback onTap;
  final EdgeInsets padding;
  final IconData icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: AppContainer(
          padding: padding,
          color: AppColors.transparent,
          child: Icon(
            icon,
            size: size,
            color: color,
          ),
        ));
  }
}
