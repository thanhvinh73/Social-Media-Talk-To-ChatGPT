import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

import '../utils/app_colors.dart';

void Function() showImagePickerDialog({
  required VoidCallback onSelectOption1,
  required VoidCallback onSelectOption2,
  required String option1Label,
  required String option2Label,
}) =>
    BotToast.showAnimationWidget(
        toastBuilder: (cancelFunc) => Material(
              color: AppColors.transparent,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ImagePickerDialogContent(
                  option1Label: option1Label,
                  option2Label: option2Label,
                  onSelectOption1: () {
                    cancelFunc();
                    onSelectOption1.call();
                  },
                  onSelectOption2: () {
                    cancelFunc();
                    onSelectOption2.call();
                  },
                  handleClose: cancelFunc,
                ),
              ),
            ),
        backgroundColor: AppColors.black.withOpacity(0.5),
        animationDuration: const Duration(microseconds: 500),
        allowClick: false,
        crossPage: false);

class ImagePickerDialogContent extends StatelessWidget {
  final String option1Label;
  final String option2Label;
  final VoidCallback onSelectOption1;
  final VoidCallback onSelectOption2;
  final VoidCallback handleClose;

  const ImagePickerDialogContent(
      {required this.option1Label,
      required this.option2Label,
      required this.onSelectOption1,
      required this.onSelectOption2,
      required this.handleClose,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(color: AppColors.transparent),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 20),
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: TapRegion(
                onTapOutside: (event) => handleClose.call(),
                child: Wrap(
                  runSpacing: 4,
                  children: [
                    InkWell(
                      onTap: onSelectOption1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              option1Label,
                              color: AppColors.titleText,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onSelectOption2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              option2Label,
                              color: AppColors.titleText,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: handleClose,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              "Hủy",
                              color: AppColors.titleText,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
    );
  }
}

Function() showLoading({
  WrapAnimation? wrapToastAnimation,
  BackButtonBehavior? backButtonBehavior,
  VoidCallback? onClose,
  Duration? duration,
  Duration? animationDuration,
  Duration? animationReverseDuration,
}) {
  return BotToast.showCustomLoading(
    wrapAnimation:
        (AnimationController controller, CancelFunc cancelFunc, Widget child) =>
            FadeAnimation(controller: controller, child: child),
    wrapToastAnimation: wrapToastAnimation,
    align: Alignment.center,
    enableKeyboardSafeArea: true,
    backButtonBehavior: backButtonBehavior,
    toastBuilder: (_) => const AppLoadingWidget(),
    clickClose: false,
    allowClick: false,
    crossPage: true,
    ignoreContentClick: true,
    onClose: onClose,
    duration: duration,
    animationDuration: animationDuration,
    animationReverseDuration: animationReverseDuration,
    backgroundColor: Colors.black26,
  );
}

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(color: AppColors.white));
  }
}

class FadeAnimation extends StatefulWidget {
  final Widget? child;
  final AnimationController controller;

  const FadeAnimation({Key? key, this.child, required this.controller})
      : super(key: key);

  @override
  FadeAnimationState createState() => FadeAnimationState();
}

class FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);
  late final Animation<double> animation;
  late final Animation<double> animationOpacity;

  @override
  void initState() {
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);

    animationOpacity = tweenOpacity.animate(animation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationOpacity,
      child: widget.child,
    );
  }
}
