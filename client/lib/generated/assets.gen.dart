/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_account.svg
  SvgGenImage get icAccount => const SvgGenImage('assets/icons/ic_account.svg');

  /// File path: assets/icons/ic_alarm.svg
  SvgGenImage get icAlarm => const SvgGenImage('assets/icons/ic_alarm.svg');

  /// File path: assets/icons/ic_calendar.svg
  SvgGenImage get icCalendar =>
      const SvgGenImage('assets/icons/ic_calendar.svg');

  /// File path: assets/icons/ic_chat.svg
  SvgGenImage get icChat => const SvgGenImage('assets/icons/ic_chat.svg');

  /// File path: assets/icons/ic_chatBot.svg
  SvgGenImage get icChatBot => const SvgGenImage('assets/icons/ic_chatBot.svg');

  /// File path: assets/icons/ic_copy.svg
  SvgGenImage get icCopy => const SvgGenImage('assets/icons/ic_copy.svg');

  /// File path: assets/icons/ic_error_warning_fill.svg
  SvgGenImage get icErrorWarningFill =>
      const SvgGenImage('assets/icons/ic_error_warning_fill.svg');

  /// File path: assets/icons/ic_eye.svg
  SvgGenImage get icEye => const SvgGenImage('assets/icons/ic_eye.svg');

  /// File path: assets/icons/ic_eye_off.svg
  SvgGenImage get icEyeOff => const SvgGenImage('assets/icons/ic_eye_off.svg');

  /// File path: assets/icons/ic_eye_slash.svg
  SvgGenImage get icEyeSlash =>
      const SvgGenImage('assets/icons/ic_eye_slash.svg');

  /// File path: assets/icons/ic_facebook.svg
  SvgGenImage get icFacebook =>
      const SvgGenImage('assets/icons/ic_facebook.svg');

  /// File path: assets/icons/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/icons/ic_home.svg');

  /// File path: assets/icons/ic_instagram.svg
  SvgGenImage get icInstagram =>
      const SvgGenImage('assets/icons/ic_instagram.svg');

  /// File path: assets/icons/ic_lock.svg
  SvgGenImage get icLock => const SvgGenImage('assets/icons/ic_lock.svg');

  /// File path: assets/icons/ic_logout.svg
  SvgGenImage get icLogout => const SvgGenImage('assets/icons/ic_logout.svg');

  /// File path: assets/icons/ic_mic.svg
  SvgGenImage get icMic => const SvgGenImage('assets/icons/ic_mic.svg');

  /// File path: assets/icons/ic_notification.svg
  SvgGenImage get icNotification =>
      const SvgGenImage('assets/icons/ic_notification.svg');

  /// File path: assets/icons/ic_notifications_none.svg
  SvgGenImage get icNotificationsNone =>
      const SvgGenImage('assets/icons/ic_notifications_none.svg');

  /// File path: assets/icons/ic_setting.svg
  SvgGenImage get icSetting => const SvgGenImage('assets/icons/ic_setting.svg');

  /// File path: assets/icons/pc_fetch_api.svg
  SvgGenImage get pcFetchApi =>
      const SvgGenImage('assets/icons/pc_fetch_api.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icAccount,
        icAlarm,
        icCalendar,
        icChat,
        icChatBot,
        icCopy,
        icErrorWarningFill,
        icEye,
        icEyeOff,
        icEyeSlash,
        icFacebook,
        icHome,
        icInstagram,
        icLock,
        icLogout,
        icMic,
        icNotification,
        icNotificationsNone,
        icSetting,
        pcFetchApi
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/empty_conversation.png
  AssetGenImage get emptyConversation =>
      const AssetGenImage('assets/images/empty_conversation.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/image_loading.png
  AssetGenImage get imageLoading =>
      const AssetGenImage('assets/images/image_loading.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/microsoft.png
  AssetGenImage get microsoft =>
      const AssetGenImage('assets/images/microsoft.png');

  /// File path: assets/images/voice-no-background.png
  AssetGenImage get voiceNoBackground =>
      const AssetGenImage('assets/images/voice-no-background.png');

  /// File path: assets/images/voice.png
  AssetGenImage get voice => const AssetGenImage('assets/images/voice.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        emptyConversation,
        google,
        imageLoading,
        logo,
        microsoft,
        voiceNoBackground,
        voice
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/vi.json
  String get vi => 'assets/translations/vi.json';

  /// List of all assets
  List<String> get values => [vi];
}

class Assets {
  Assets._();

  static const String comTan5f0885096433 = 'assets/com-tan-5f0885096433.json';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();

  /// List of all assets
  List<String> get values => [comTan5f0885096433];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
