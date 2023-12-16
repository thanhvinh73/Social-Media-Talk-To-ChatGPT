import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:social_media_with_chatgpt/generated/assets.gen.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/models/user/user.dart';
import 'package:social_media_with_chatgpt/public_providers/app_user_cubit/app_user_cubit.dart';
import 'package:social_media_with_chatgpt/routes/app_router.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/components/home_add_friend_item.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/components/home_container.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/components/home_post_item.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_network_image.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_refresh_indicator.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..getAllPost(),
      child: AppDismissKeyboard(
        onWillPop: false,
        child: AppLayout(
          useSafeArea: true,
          showAppBar: false,
          backgroundColor: AppColors.background,
          child: BlocBuilder<AppUserCubit, AppUserState>(
            builder: (context, state) {
              return Column(
                children: [
                  HomeContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Assets.images.logo.image(height: 40),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              size: 33,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => AppRefreshIndicator(
                        onRefresh: context.read<HomeScreenCubit>().getAllPost,
                        child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 10,
                            children: [
                              HomeContainer(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.account);
                                      },
                                      child: AppNetworkImage(
                                        url: state.profile?.avatar.getFileUrl,
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: AppTextField(
                                        placeholder:
                                            "Chia sẻ cảm xúc của bạn tại đây...",
                                        readOnly: true,
                                        onTap: () {
                                          Get.toNamed(Routes.createPost)
                                              ?.then((value) {
                                            if (value is Post) {
                                              context
                                                  .read<HomeScreenCubit>()
                                                  .updateState((p0) =>
                                                      p0.copyWith(
                                                          posts: p0.posts
                                                              .addFirst(
                                                                  value)));
                                            }
                                          });
                                        },
                                        showCursor: false,
                                        focusBorderColor: AppColors.basicGrey,
                                        onChanged: (_) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: HomeContainer(
                                    child: Wrap(
                                  spacing: 12,
                                  children: List<int>.generate(
                                          10, (index) => index)
                                      .map((e) => HomeAddFriendItem(
                                          user: const User(lastname: "Dart")))
                                      .toList(),
                                )),
                              ),
                              BlocSelector<HomeScreenCubit, HomeScreenState,
                                  List<Post>>(
                                selector: (state) => state.posts,
                                builder: (context, posts) {
                                  return posts.isNotNullOrEmpty
                                      ? Wrap(
                                          runSpacing: 10,
                                          children: posts
                                              .map((e) => HomePostItem(
                                                    post: e,
                                                    onDeletePost: () {
                                                      context
                                                          .read<
                                                              HomeScreenCubit>()
                                                          .updateState((p0) => p0.copyWith(
                                                              posts: p0.posts
                                                                  .removeElement(
                                                                      (item) =>
                                                                          item.postId ==
                                                                          e.postId)));
                                                    },
                                                  ))
                                              .toList(),
                                        )
                                      : const SizedBox.shrink();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
