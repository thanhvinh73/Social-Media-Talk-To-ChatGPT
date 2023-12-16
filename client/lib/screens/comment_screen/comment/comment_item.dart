import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/models/comment/comment.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/shared/extensions/date_ext.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_list_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.comment,
    this.onTap,
  });
  final Comment comment;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            height: 43,
            width: 43,
            borderRadius: BorderRadius.circular(43),
            fit: BoxFit.cover,
            url: comment.user?.avatar.getFileUrl,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppContainer(
                  padding: const EdgeInsets.all(10),
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(comment.user.fullname,
                          color: AppColors.titleText,
                          fontWeight: FontWeight.w500),
                      AppText(comment.content, color: AppColors.bodyText)
                    ],
                  ),
                ),
                AppListImage(
                    imgsUrl: comment.images.map((e) => e.getFileUrl).toList(),
                    amountOfImageShow: 6),
                AppText(
                  DateTime.fromMillisecondsSinceEpoch(comment.createAt ?? 0)
                      .toDayMonthYearTime,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
