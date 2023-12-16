import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/public_providers/app_user_cubit/app_user_cubit.dart';
import 'package:social_media_with_chatgpt/routes/app_router.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:social_media_with_chatgpt/shared/extensions/date_ext.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_icon_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_list_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class HomePostItem extends StatefulWidget {
  const HomePostItem({
    super.key,
    required this.post,
    this.onCommentTap,
    this.onDeletePost,
  });
  final Post post;
  final VoidCallback? onCommentTap;
  final VoidCallback? onDeletePost;

  @override
  State<HomePostItem> createState() => _HomePostItemState();
}

class _HomePostItemState extends State<HomePostItem> {
  bool like = false;
  Post get post => widget.post;
  User? currentUser;

  @override
  Widget build(BuildContext context) {
    currentUser = context.read<AppUserCubit>().state.user;
    return GestureDetector(
        onTap: () {},
        child: AppContainer(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              AppImage(
                                backgroundColor: AppColors.white,
                                height: 50,
                                width: 50,
                                borderRadius: BorderRadius.circular(50),
                                url: post.authorUser?.avatar.getFileUrl,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      post.authorUser?.fullname,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.titleText,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    AppText(
                                      DateTime.fromMillisecondsSinceEpoch(
                                              post.createAt ?? 0)
                                          .toDayMonthYearTime,
                                      color: AppColors.bodyText,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (currentUser?.id == post.authorUser?.id)
                          AppIconButton(
                              onTap: () {
                                Get.toNamed(Routes.createPost, arguments: post)
                                    ?.then((value) {
                                  if (value is Post) {
                                    context.read<HomeScreenCubit>().updateState(
                                        (p0) => p0.copyWith(
                                            posts: p0.posts.update(
                                                (item) => value,
                                                (item) =>
                                                    item.postId ==
                                                    value.postId)));
                                  } else if (value is bool && value) {
                                    widget.onDeletePost?.call();
                                  }
                                });
                              },
                              icon: Icons.edit,
                              color: AppColors.darkgreen)
                      ],
                    ),
                    AppText(
                      post.title,
                      color: AppColors.titleText,
                      fontWeight: FontWeight.w700,
                      padding: const EdgeInsets.only(top: 12),
                    ),
                    AppText(
                      post.description,
                      color: AppColors.bodyText,
                      fontWeight: FontWeight.w500,
                      padding: const EdgeInsets.only(bottom: 12, top: 4),
                    ),
                  ],
                ),
              ),
              if (post.images.length > 2)
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppListImage(
                    imgsUrl: post.images.map((e) => e.getFileUrl).toList(),
                    amountOfImageShow: 6,
                  ),
                )
              else if (post.images.length == 2)
                Row(
                  children: [
                    Expanded(
                      child: AppImage(
                        onTap: () {
                          Get.toNamed(Routes.photoGallery, arguments: [
                            [
                              post.images.first.getFileUrl,
                              post.images.last.getFileUrl
                            ],
                            0
                          ]);
                        },
                        url: post.images.first.getFileUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: AppImage(
                        onTap: () {
                          Get.toNamed(Routes.photoGallery, arguments: [
                            [
                              post.images.first.getFileUrl,
                              post.images.last.getFileUrl
                            ],
                            1
                          ]);
                        },
                        url: post.images.last.getFileUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              else if (post.images.isNotNullOrEmpty)
                AppImage(
                  onTap: () {
                    Get.toNamed(Routes.photoGallery, arguments: [
                      [post.images.first.getFileUrl],
                      0
                    ]);
                  },
                  url: post.images.first.getFileUrl,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "1 lượt yêu thích",
                    ),
                    AppText(
                      "${post.commentsLength} bình luận",
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          like = !like;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          like
                              ? Icon(Icons.favorite, color: AppColors.red)
                              : Icon(Icons.favorite_border_rounded),
                          const SizedBox(width: 4),
                          AppText(
                            "Yêu thích",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (widget.onCommentTap != null) {
                          widget.onCommentTap?.call();
                          return;
                        }
                        await Get.toNamed(Routes.comment, arguments: post);
                        await context
                            .read<HomeScreenCubit>()
                            .getUpdatePostById(post.postId!);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.chat_bubble),
                          const SizedBox(width: 4),
                          AppText(
                            "Bình luận",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ));
  }
}
