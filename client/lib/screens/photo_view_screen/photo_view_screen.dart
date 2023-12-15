import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

import '../../shared/helpers/bot_toast_helper.dart';

class PhotoViewScreen extends StatefulWidget {
  const PhotoViewScreen({
    super.key,
    required this.urls,
    required this.initIndex,
  });
  final List<String> urls;
  final int initIndex;

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  late int currentIndex;
  late final _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initIndex);
    currentIndex = widget.initIndex;
  }

  void _onChangePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.black.withOpacity(0.8),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.chevron_left,
                  color: AppColors.white,
                  size: 33,
                ),
              ),
              title: AppText(
                "Hình ${currentIndex + 1}/${widget.urls.length}",
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              centerTitle: true,
            ),
            backgroundColor: AppColors.black.withOpacity(0.8),
            body: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              enableRotation: false,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions.customChild(
                    minScale: PhotoViewComputedScale.contained,
                    heroAttributes:
                        PhotoViewHeroAttributes(tag: widget.urls[index]),
                    initialScale: PhotoViewComputedScale.contained,
                    child: CachedNetworkImage(
                      imageUrl: widget.urls[index],
                    ));
              },
              itemCount: widget.urls.length,
              loadingBuilder: (context, event) => const AppLoadingWidget(),
              pageController: _pageController,
              onPageChanged: _onChangePage,
              scrollDirection: Axis.horizontal,
            )),
      ),
    );
  }
}
