import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppSlider extends StatefulWidget {
  const AppSlider(
      {super.key,
      required this.itemCount,
      required this.itemRender,
      this.initPage = 0,
      this.reverse = false,
      this.pageSnapping = true,
      this.padEnds = true,
      this.scrollPhysics,
      this.scrollDirection = Axis.horizontal,
      this.onPageChanged,
      this.viewportFraction = 0.8,
      this.showIndicator = false,
      this.showNextButton = true,
      this.height,
      this.width});
  final int itemCount;
  final int initPage;
  final Widget? Function(BuildContext context, int index) itemRender;
  final bool reverse;
  final bool pageSnapping;
  final bool padEnds;
  final ScrollPhysics? scrollPhysics;
  final Axis scrollDirection;
  final void Function(int page)? onPageChanged;
  final double viewportFraction;
  final bool showIndicator;
  final bool showNextButton;
  final double? height;
  final double? width;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  late final PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
        initialPage: widget.initPage,
        viewportFraction: widget.viewportFraction);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? MediaQuery.of(context).size.height,
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.itemCount,
            controller: pageController,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
              widget.onPageChanged?.call(page);
            },
            reverse: widget.reverse,
            allowImplicitScrolling: false,
            pageSnapping: widget.pageSnapping,
            padEnds: widget.padEnds,
            physics: widget.scrollPhysics,
            scrollDirection: widget.scrollDirection,
            itemBuilder: (context, index) => widget.itemRender(context, index),
          ),
          if (widget.showNextButton)
            Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.fastOutSlowIn);
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        size: 32,
                        color: AppColors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.fastOutSlowIn);
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 32,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )),
          if (widget.showIndicator)
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _indicators(widget.itemCount, currentPage),
              ),
            )
        ],
      ),
    );
  }

  List<Widget> _indicators(itemCount, currentIndex) {
    return List<Widget>.generate(itemCount, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.black : AppColors.white,
            border: Border.all(color: AppColors.black, width: 0.5),
            shape: BoxShape.circle),
      );
    });
  }
}
