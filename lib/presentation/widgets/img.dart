import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happy_money/app/utils/utils.dart';
import 'package:happy_money/presentation/widgets/loading_indicator.dart';
import 'package:validators/validators.dart';

enum ImgType { noImage, network, asset, file, assetSvg }

///
/// Display images of type network, asset, file
///
/// use it: [Img.network]
/// ```dart
/// Img.network(
///   URL_PATH,
///   width: 100,
///   height: 100,
/// ),
/// ```
///
/// use it: [Img.asset]
/// ```dart
/// Img.asset(
///   ASSET_PATH,
///   width: 100,
///   height: 100,
/// ),
/// ```
///
/// use it: [Img.file]
/// ```dart
/// Img.file(
///   FILE,
///   width: 100,
///   height: 100,
/// ),
/// ```
///
const _kDefaultPackage = 'resources';

class Img extends StatelessWidget {
  /// It is a wrapper for [Image.asset].
  const Img.asset(
    String? name, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
    ImageFrameBuilder? frameBuilder,
    this.placeholder,
    this.errorWidget,
    String? package = _kDefaultPackage,
    this.alignment = Alignment.center,
  }) : _value = name,
       _imgType = ImgType.asset,
       _frameBuilder = frameBuilder,
       _imageBuilder = null,
       _package = package,
       _colorBlendMode = null,
       _colorFilter = null;

  const Img.network(
    String? uri, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
    ImageWidgetBuilder? imageBuilder,
    this.placeholder,
    this.errorWidget,
    this.alignment = Alignment.center,
  }) : _value = uri,
       _imgType = ImgType.network,
       _imageBuilder = imageBuilder,
       _frameBuilder = null,
       _package = null,
       _colorBlendMode = null,
       _colorFilter = null;

  /// It is a wrapper for [Image.file].
  /// Output "No Image" if [File] is null.
  const Img.file(
    File? file, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
    ImageFrameBuilder? frameBuilder,
    this.placeholder,
    this.errorWidget,
    this.alignment = Alignment.center,
  }) : _value = file,
       _imgType = ImgType.file,
       _frameBuilder = frameBuilder,
       _imageBuilder = null,
       _package = null,
       _colorBlendMode = null,
       _colorFilter = null;

  /// It is a wrapper for [SvgPicture.asset].
  const Img.assetSvg(
    String? name, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.placeholder,
    this.errorWidget,
    BlendMode? blendMode,
    ColorFilter? colorFilter,
    String? package = _kDefaultPackage,
    this.alignment = Alignment.center,
  }) : _value = name,
       _imgType = ImgType.assetSvg,
       _frameBuilder = null,
       _imageBuilder = null,
       _package = package,
       _colorBlendMode = blendMode,
       _colorFilter = colorFilter;

  const Img.noImage({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    String? package,
  }) : _value = null,
       _imgType = ImgType.noImage,
       color = null,
       _frameBuilder = null,
       placeholder = null,
       errorWidget = null,
       _imageBuilder = null,
       _package = package,
       _colorBlendMode = null,
       _colorFilter = null;

  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Alignment alignment;

  final Widget? placeholder;
  final Widget? errorWidget;

  // Image
  final ImageFrameBuilder? _frameBuilder;

  // CachedNetworkImage
  final ImageWidgetBuilder? _imageBuilder;

  final String? _package;
  final BlendMode? _colorBlendMode;
  final ColorFilter? _colorFilter;

  final Object? _value;
  final ImgType _imgType;

  @override
  Widget build(BuildContext context) {
    try {
      return switch (_imgType) {
        // Handle asset
        ImgType.asset when _value.isString && !_value.isEmpty => Image.asset(
          _value! as String,
          width: width,
          height: height,
          color: color,
          fit: fit,
          alignment: alignment,
          frameBuilder: _frameBuilder,
          package: _package,
          errorBuilder: (context, _, _) => errorWidget ?? _noImage(),
        ),

        // Handle network
        ImgType.network when _value.isString && isURL(_value! as String) =>
          CachedNetworkImage(
            imageUrl: _value as String,
            width: width,
            height: height,
            alignment: alignment,
            fit: fit,
            color: color,
            imageBuilder: _imageBuilder,
            placeholder: (context, url) => placeholder ?? const Indicator(),
            errorWidget: (context, url, error) => errorWidget ?? _noImage(),
          ),

        // Handle file
        ImgType.file when _value.isFile => Image.file(
          _value! as File,
          width: width,
          height: height,
          color: color,
          fit: fit,
          alignment: alignment,
          frameBuilder: _frameBuilder,
          errorBuilder: (context, _, __) => errorWidget ?? _noImage(),
        ),

        // Handle svg
        ImgType.assetSvg when _value.isString && !_value.isEmpty =>
          SvgPicture.asset(
            _value! as String,
            width: width,
            height: height,
            fit: fit ?? BoxFit.contain,
            alignment: alignment,
            package: _package,
            placeholderBuilder: (_) => placeholder ?? _noImage(),
            colorFilter:
                _colorFilter ?? _getColorFilter(color, _colorBlendMode),
          ),

        // Handle other
        _ => errorWidget ?? _noImage(),
      };
    } catch (e) {
      return errorWidget ?? _noImage();
    }
  }

  Widget _noImage() {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: const Icon(Icons.image_not_supported),
        // child: R.icons.icLauncher.image(
        //   width: (width ?? 30.w) / 1.5,
        //   height: (height ?? 30.w) / 1.5,
        //   fit: fit,
        //   alignment: alignment,
        //   opacity: Animation.fromValueListenable(ValueNotifier(0.15)),
        // ),
      ),
    );
  }

  static ColorFilter? _getColorFilter(
    Color? color,
    BlendMode? colorBlendMode,
  ) => color == null
      ? null
      : ColorFilter.mode(color, colorBlendMode ?? BlendMode.srcIn);
}
