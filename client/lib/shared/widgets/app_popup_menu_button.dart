import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/extensions/string_ext.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class PopupMenuItemModel<T> {
  T value;
  String label;
  Widget? icon;
  final TextStyle? Function(TextStyle?)? onUpdateStyle;
  PopupMenuItemModel({
    required this.value,
    required this.label,
    this.onUpdateStyle,
    this.icon,
  });
}

class AppPopUpMenuButton<T> extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Widget? child;
  final List<PopupMenuItemModel<T>> items;
  final Function(T) onItemSelected;
  final VoidCallback? disableTapping;
  final bool showDivider;
  const AppPopUpMenuButton({
    this.icon = Icons.expand_more,
    this.iconColor = AppColors.titleText,
    this.child,
    required this.items,
    required this.onItemSelected,
    this.showDivider = true,
    this.disableTapping,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return GestureDetector(
      onTap: disableTapping,
      child: PopupMenuButton<T>(
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          splashRadius: 20,
          onSelected: onItemSelected,
          enabled: disableTapping == null,
          onOpened: disableTapping,
          itemBuilder: (context) => items.asMap().entries.toList().fold(
              [],
              (previousValue, entry) => [
                    ...previousValue,
                    if (showDivider && entry.key > 0)
                      PopupMenuItem<T>(
                        enabled: false,
                        padding: EdgeInsets.zero,
                        height: 1,
                        child: const Divider(
                          height: 1,
                        ),
                      ),
                    PopupMenuItem<T>(
                      value: entry.value.value,
                      child: PopUpMenuItemWidget(
                        label: entry.value.label,
                        icon: entry.value.icon,
                        onUpdateStyle: entry.value.onUpdateStyle,
                      ),
                    ),
                  ]),
          child: child ??
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
                child: const Icon(
                  Icons.expand_more,
                  color: AppColors.darkgreen,
                  size: 24,
                ),
              )),
    );
  }
}

class PopUpMenuItemWidget extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final TextStyle? Function(TextStyle?)? onUpdateStyle;

  const PopUpMenuItemWidget({
    required this.label,
    this.icon,
    this.onUpdateStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) icon!,
        if (icon != null) const SizedBox(width: 10),
        if (label.isNotEmptyOrNull)
          AppText(
            label,
            fontSize: 16,
            color: AppColors.titleText,
            fontWeight: FontWeight.w500,
          ),
      ],
    );
  }
}

// PopupMenuItem<MenuActions>(
//   value: MenuActions.rename,
//   child: CRUDBottomsheetAcrions.buildItem(
//       MenuActions.rename, context),
// ),
// const PopupMenuItem<MenuActions>(
//   enabled: false,
//   padding: EdgeInsets.zero,
//   height: 1,
//   child: Divider(
//     height: 1,
//   ),
// ),
// PopupMenuItem<MenuActions>(
//   value: MenuActions.delete,
//   child: CRUDBottomsheetAcrions.buildItem(
//       MenuActions.delete, context),
// ),
