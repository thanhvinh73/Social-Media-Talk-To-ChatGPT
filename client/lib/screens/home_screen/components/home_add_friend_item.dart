import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class HomeAddFriendItem extends StatelessWidget {
  const HomeAddFriendItem({
    super.key,
    required this.user,
    this.size = 70,
  });
  final User user;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppImage(
          backgroundColor: AppColors.white,
          height: size,
          width: size,
          borderRadius: BorderRadius.circular(size),
          url: user.avatar?.url ??
              "https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png",
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: size,
          child: AppText(
            user.fullname,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontSize: 15,
            color: AppColors.titleText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
