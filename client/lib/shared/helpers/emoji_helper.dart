import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';

class EmojiHelper extends StatelessWidget {
  const EmojiHelper({
    super.key,
    required this.isShow,
    required this.controller,
    this.height,
    this.width,
    this.onTapOutside,
    this.onEmojiSelected,
    this.onBackspacePressed,
  });
  final bool isShow;
  final double? height;
  final double? width;
  final VoidCallback? onTapOutside;
  final TextEditingController controller;
  final void Function(Category? category, Emoji emoji)? onEmojiSelected;
  final void Function()? onBackspacePressed;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isShow,
      child: TapRegion(
        onTapOutside: (event) => onTapOutside?.call(),
        child: SizedBox(
          height: height,
          width: width,
          child: EmojiPicker(
            textEditingController: controller,
            onEmojiSelected: onEmojiSelected,
            onBackspacePressed: () {
              controller
                ..text = controller.text.characters.toString()
                ..selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length));
              onBackspacePressed?.call();
            },
            config: Config(
              columns: 7,
              emojiSizeMax: 30 *
                  (foundation.defaultTargetPlatform == TargetPlatform.iOS
                      ? 1.30
                      : 1.0),
              verticalSpacing: 0,
              horizontalSpacing: 0,
              gridPadding: EdgeInsets.zero,
              initCategory: Category.SMILEYS,
              bgColor: AppColors.white,
              indicatorColor: AppColors.green,
              iconColor: AppColors.gray,
              iconColorSelected: AppColors.green,
              backspaceColor: AppColors.darkgreen,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: Colors.grey,
              enableSkinTones: true,
              recentTabBehavior: RecentTabBehavior.RECENT,
              recentsLimit: 28,
              replaceEmojiOnLimitExceed: false,
              noRecents: const Text(
                'No Recents',
                style: TextStyle(fontSize: 20, color: Colors.black26),
                textAlign: TextAlign.center,
              ),
              loadingIndicator: const SizedBox.shrink(),
              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL,
              checkPlatformCompatibility: true,
            ),
          ),
        ),
      ),
    );
  }
}
