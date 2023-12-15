import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_with_chatgpt/shared/helpers/dialog_helper.dart';

class ImagePickerUtils {
  static final _imagePicker = ImagePicker();
  static Future<File?> selectPhoto(
      BuildContext context, ImageSource source) async {
    try {
      XFile? photo = await _imagePicker.pickImage(
          source: source, maxHeight: 1800, maxWidth: 1800);
      if (photo != null) {
        return File(photo.path);
      }
      return null;
    } on PlatformException catch (err) {
      if (err.code == "camera_access_denied") {
        showErrorDialog(context,
            title: "Không có quyền truy cập",
            content:
                "Ứng dụng không có quyền truy cập vào máy ảnh của bạn. Nếu bạn muốn sử dụng máy ảnh, vui lòng cấp quyền!");
      }
    }
    return null;
  }

  static Future<File?> selectVideo(
      BuildContext context, ImageSource source) async {
    try {
      XFile? video = await _imagePicker.pickVideo(
          maxDuration: const Duration(minutes: 2), source: source);
      if (video != null) {
        return File(video.path);
      }
    } on PlatformException catch (err) {
      if (err.code == "camera_access_denied") {
        showErrorDialog(context,
            title: "Không có quyền truy cập",
            content:
                "Ứng dụng không có quyền truy cập vào máy ảnh của bạn. Nếu bạn muốn sử dụng máy ảnh, vui lòng cấp quyền!");
      }
    }

    return null;
  }

  static Future<List<File?>> selectMultiPhoto() async {
    List<XFile?> photos =
        await _imagePicker.pickMultiImage(maxHeight: 1800, maxWidth: 1800);
    if (photos.isNotEmpty) {
      List<File> result = [];
      for (XFile? xFile in photos) {
        if (xFile != null) {
          result.add(File(xFile.path));
        }
      }
      return result;
    }
    return [];
  }
}
