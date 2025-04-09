/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/music.mp3
  String get music => 'assets/audio/music.mp3';

  /// List of all assets
  List<String> get values => [music];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Araside.ttf
  String get araside => 'assets/fonts/Araside.ttf';

  /// List of all assets
  List<String> get values => [araside];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Volume_off.png
  AssetGenImage get volumeOff =>
      const AssetGenImage('assets/icons/Volume_off.png');

  /// File path: assets/icons/Volume_up.png
  AssetGenImage get volumeUp =>
      const AssetGenImage('assets/icons/Volume_up.png');

  /// File path: assets/icons/bg.png
  AssetGenImage get bg => const AssetGenImage('assets/icons/bg.png');

  /// File path: assets/icons/cell.png
  AssetGenImage get cell => const AssetGenImage('assets/icons/cell.png');

  /// File path: assets/icons/chicken1.png
  AssetGenImage get chicken1 =>
      const AssetGenImage('assets/icons/chicken1.png');

  /// File path: assets/icons/chicken2.png
  AssetGenImage get chicken2 =>
      const AssetGenImage('assets/icons/chicken2.png');

  /// File path: assets/icons/chicken3.png
  AssetGenImage get chicken3 =>
      const AssetGenImage('assets/icons/chicken3.png');

  /// File path: assets/icons/clear.png
  AssetGenImage get clear => const AssetGenImage('assets/icons/clear.png');

  /// File path: assets/icons/egg.png
  AssetGenImage get egg => const AssetGenImage('assets/icons/egg.png');

  /// File path: assets/icons/eggs.png
  AssetGenImage get eggs => const AssetGenImage('assets/icons/eggs.png');

  /// File path: assets/icons/exit.png
  AssetGenImage get exit => const AssetGenImage('assets/icons/exit.png');

  /// File path: assets/icons/gameOver.png
  AssetGenImage get gameOver =>
      const AssetGenImage('assets/icons/gameOver.png');

  /// File path: assets/icons/info.png
  AssetGenImage get info => const AssetGenImage('assets/icons/info.png');

  /// File path: assets/icons/newGame.png
  AssetGenImage get newGame => const AssetGenImage('assets/icons/newGame.png');

  /// File path: assets/icons/pauseDialog.png
  AssetGenImage get pauseDialog =>
      const AssetGenImage('assets/icons/pauseDialog.png');

  /// File path: assets/icons/pauseLbl.png
  AssetGenImage get pauseLbl =>
      const AssetGenImage('assets/icons/pauseLbl.png');

  /// File path: assets/icons/play.png
  AssetGenImage get play => const AssetGenImage('assets/icons/play.png');

  /// File path: assets/icons/privacy.png
  AssetGenImage get privacy => const AssetGenImage('assets/icons/privacy.png');

  /// File path: assets/icons/resBoard.png
  AssetGenImage get resBoard =>
      const AssetGenImage('assets/icons/resBoard.png');

  /// File path: assets/icons/retry.png
  AssetGenImage get retry => const AssetGenImage('assets/icons/retry.png');

  /// File path: assets/icons/startImg.png
  AssetGenImage get startImg =>
      const AssetGenImage('assets/icons/startImg.png');

  /// File path: assets/icons/stone.png
  AssetGenImage get stone => const AssetGenImage('assets/icons/stone.png');

  /// File path: assets/icons/terms.png
  AssetGenImage get terms => const AssetGenImage('assets/icons/terms.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        volumeOff,
        volumeUp,
        bg,
        cell,
        chicken1,
        chicken2,
        chicken3,
        clear,
        egg,
        eggs,
        exit,
        gameOver,
        info,
        newGame,
        pauseDialog,
        pauseLbl,
        play,
        privacy,
        resBoard,
        retry,
        startImg,
        stone,
        terms
      ];
}

class Assets {
  const Assets._();

  static const AssetGenImage applogo = AssetGenImage('assets/applogo.png');
  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();

  /// List of all assets
  static List<AssetGenImage> get values => [applogo];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
