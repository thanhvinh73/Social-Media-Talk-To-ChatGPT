import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class HomePostItem extends StatefulWidget {
  const HomePostItem({
    super.key,
    required this.post,
    this.onTap,
  });
  final Post post;
  final VoidCallback? onTap;

  @override
  State<HomePostItem> createState() => _HomePostItemState();
}

class _HomePostItemState extends State<HomePostItem> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: AppContainer(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppImage(
                          backgroundColor: AppColors.white,
                          height: 50,
                          width: 50,
                          borderRadius: BorderRadius.circular(50),
                          url: "",
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "ilovecat123",
                              fontWeight: FontWeight.bold,
                              color: AppColors.titleText,
                            ),
                            AppText(
                              "ilovecat123",
                              color: AppColors.bodyText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppText(
                      "Post content goes here. This can be a long text, an image, or any other content.",
                      color: AppColors.bodyText,
                      fontWeight: FontWeight.w500,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ],
                ),
              ),
              AppImage(
                url:
                    "https://www.rainforest-alliance.org/wp-content/uploads/2021/06/capybara-square-1.jpg.optimal.jpg",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
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
                      onTap: () {},
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
