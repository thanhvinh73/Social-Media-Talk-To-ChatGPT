import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_with_chatgpt/models/comment/comment.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/screens/comment_screen/comment/comment_item.dart';
import 'package:social_media_with_chatgpt/screens/comment_screen/cubit/comment_screen_cubit.dart';
import 'package:social_media_with_chatgpt/screens/create_post_screen/create_post_screen.dart';
import 'package:social_media_with_chatgpt/screens/home_screen/components/home_post_item.dart';
import 'package:social_media_with_chatgpt/shared/enum/screen_status.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';
import 'package:social_media_with_chatgpt/shared/helpers/banner.helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dialog_helper.dart';
import 'package:social_media_with_chatgpt/shared/helpers/emoji_helper.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/utils/image_picker.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_container.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_icon_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_layout.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_popup_menu_button.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_text_field.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.post});
  final Post post;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late Post post;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController textController = TextEditingController();
  bool showEmoji = false;

  @override
  void initState() {
    post = widget.post;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets viewInsets = MediaQuery.of(context).viewInsets;
    return AppDismissKeyboard(
      onWillPop: true,
      child: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
          setState(() {
            showEmoji = false;
          });
        },
        child: BlocProvider(
          create: (context) =>
              CommentScreenCubit()..getComments(widget.post.postId!),
          child: MultiBlocListener(
            listeners: [
              BlocListener<CommentScreenCubit, CommentScreenState>(
                listenWhen: (previous, current) =>
                    previous.errorMessage != current.errorMessage &&
                    current.errorMessage != null,
                listener: (context, state) {
                  showErrorDialog(context, content: state.errorMessage)
                      .then((value) {
                    context
                        .read<CommentScreenCubit>()
                        .updateState((p0) => p0.copyWith(errorMessage: null));
                  });
                },
              ),
              BlocListener<CommentScreenCubit, CommentScreenState>(
                  listenWhen: (previous, current) =>
                      previous.status != current.status,
                  listener: (context, state) {
                    if (state.status == ScreenStatus.success) {
                      setState(() {
                        post = state.currentComment!.post!;
                        textController.text = "";
                        _focusNode.unfocus();
                      });
                      context.read<CommentScreenCubit>().updateState((p0) =>
                          p0.copyWith(
                              comments:
                                  p0.comments.addFirst(state.currentComment!),
                              status: ScreenStatus.loading,
                              currentComment: null));
                      showSuccessBanner(
                          content: "Bình luận thành công!",
                          delayDurationInMilliseconds: 100);
                    }
                  }),
            ],
            child: Builder(builder: (context) {
              return AppLayout(
                useSafeArea: true,
                showAppBar: false,
                resizeToAvoidBottomInset: true,
                onWillPop: () => Future.value(true),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(
                      bottom: viewInsets.bottom + 8,
                      left: 16,
                      right: 16,
                      top: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showEmoji)
                        EmojiHelper(
                          height: 250,
                          isShow: showEmoji,
                          controller: textController,
                          onEmojiSelected: (category, emoji) {
                            context
                                .read<CommentScreenCubit>()
                                .updateCurrentComment((p0) =>
                                    p0.copyWith(content: textController.text));
                          },
                          onBackspacePressed: () {
                            context
                                .read<CommentScreenCubit>()
                                .updateCurrentComment((p0) =>
                                    p0.copyWith(content: textController.text));
                          },
                        ),
                      BlocSelector<CommentScreenCubit, CommentScreenState,
                          List<File>>(
                        selector: (state) => state.currentComment?.files ?? [],
                        builder: (context, files) {
                          return files.isNotNullOrEmpty
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppText(
                                      "Bạn đã đính kèm ${files.length} tệp",
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8)))
                              : const SizedBox.shrink();
                        },
                      ),
                      AppTextField(
                        focusNode: _focusNode,
                        controller: textController,
                        placeholder: "Nhập bình luận của bạn tại đây...",
                        maxLines: 2,
                        prefixIcon: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            AppIconButton(
                              onTap: () {
                                setState(() {
                                  showEmoji = !showEmoji;
                                });
                              },
                              padding: const EdgeInsets.only(left: 16),
                              icon: Icons.emoji_emotions_rounded,
                              color: showEmoji
                                  ? AppColors.titleText
                                  : AppColors.darkgreen,
                              size: 24,
                            ),
                            AppPopUpMenuButton<MediaOption>(
                                items: MediaOption.values
                                    .map((e) => PopupMenuItemModel(
                                        value: e,
                                        label: e.label,
                                        icon: Icon(e.icon,
                                            size: 25,
                                            color: AppColors.bodyText)))
                                    .toList(),
                                onItemSelected: (mediaOption) {
                                  switch (mediaOption) {
                                    case MediaOption.file:
                                      ImagePickerUtils.selectMultiPhoto()
                                          .then((values) {
                                        if (values.isNotNullOrEmpty) {
                                          List<File> newList = [];
                                          values.forEach((element) {
                                            if (element != null) {
                                              newList.add(element);
                                            }
                                          });
                                          context
                                              .read<CommentScreenCubit>()
                                              .updateCurrentComment((p0) =>
                                                  p0.copyWith(files: newList));
                                        }
                                      });
                                    case MediaOption.camera:
                                      ImagePickerUtils.selectPhoto(
                                              context, ImageSource.camera)
                                          .then((value) {
                                        if (value != null) {
                                          context
                                              .read<CommentScreenCubit>()
                                              .updateCurrentComment((p0) =>
                                                  p0.copyWith(files: [value]));
                                        }
                                      });
                                    case MediaOption.video:
                                    default:
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(Icons.file_present_rounded,
                                      color: AppColors.darkgreen, size: 24),
                                )),
                          ],
                        ),
                        suffixIcon: AppIconButton(
                          onTap: () {
                            context
                                .read<CommentScreenCubit>()
                                .createComment(widget.post.postId!);
                          },
                          padding: const EdgeInsets.only(right: 16, left: 8),
                          icon: Icons.send,
                          color: AppColors.darkgreen,
                          size: 24,
                        ),
                        onChanged: (_) {
                          context
                              .read<CommentScreenCubit>()
                              .updateCurrentComment((p0) =>
                                  p0.copyWith(content: textController.text));
                        },
                      ),
                    ],
                  ),
                ),
                child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                          child: AppContainer(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Wrap(
                              children: [
                                HomePostItem(
                                    post: post,
                                    onCommentTap: () {
                                      _focusNode.requestFocus();
                                    }),
                                const Divider(),
                                BlocSelector<CommentScreenCubit,
                                    CommentScreenState, List<Comment>>(
                                  selector: (state) => state.comments ?? [],
                                  builder: (context, comments) {
                                    return Wrap(
                                      children: [
                                        AppText(
                                          "${comments.length} Bình luận",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.titleText,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                        ),
                                        comments.isNotNullOrEmpty
                                            ? Wrap(
                                                children: comments
                                                    .map((e) =>
                                                        CommentItem(comment: e))
                                                    .toList())
                                            : const SizedBox.shrink()
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )),
              );
            }),
          ),
        ),
      ),
    );
  }
}
