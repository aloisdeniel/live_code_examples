import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

/// Since SVG are text files, we can easily modify them before rendering.
///
/// This allows us to create dynamic image variants, without the need to bundle every possible variant image.
class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  static String purpleBackgroundAndBlonde(data) {
    return data
        .replaceAll('#33D79A', '#8648D4')
        .replaceAll('#661313', '#FFDC98');
  }

  static String orangeBackgroundAndRed(data) {
    return data
        .replaceAll('#33D79A', '#FF9877')
        .replaceAll('#661313', '#CF5832');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                'assets/elf.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: SvgPicture.asset(
                'assets/elf.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: SvgPicture(
                PostProcessedAssetSvgPicture(
                  SvgPicture.svgStringDecoder,
                  'assets/elf.svg',
                  processor: purpleBackgroundAndBlonde,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: SvgPicture(
                PostProcessedAssetSvgPicture(
                  SvgPicture.svgStringDecoder,
                  'assets/elf.svg',
                  processor: orangeBackgroundAndRed,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

typedef SvgPostProcessor = String Function(String data);

class PostProcessedAssetSvgPicture
    extends PictureProvider<PostProcessedAssetSvgPicture> {
  /// Creates an object that decodes a [Uint8List] buffer as a picture.
  ///
  /// The arguments must not be null.
  const PostProcessedAssetSvgPicture(
    this.decoder,
    this.name, {
    required this.processor,
    ColorFilter? colorFilter,
  })  : assert(name != null), // ignore: unnecessary_null_comparison
        super(colorFilter);

  final String name;
  final SvgPostProcessor processor;

  /// The [PictureInfoDecoder] to use for decoding this picture.
  final PictureInfoDecoder<String> decoder;

  @override
  Future<PostProcessedAssetSvgPicture> obtainKey(PictureConfiguration picture) {
    return SynchronousFuture<PostProcessedAssetSvgPicture>(this);
  }

  @override
  PictureStreamCompleter load(PostProcessedAssetSvgPicture key,
      {PictureErrorListener? onError}) {
    return OneFramePictureStreamCompleter(_loadAsync(key, onError: onError));
  }

  Future<PictureInfo> _loadAsync(
    PostProcessedAssetSvgPicture key, {
    PictureErrorListener? onError,
  }) async {
    assert(key == this);
    final String data = processor(await rootBundle.loadString(key.name));
    if (onError != null) {
      return decoder(
        data,
        colorFilter,
        key.toString(),
      ).catchError((Object error, StackTrace stack) {
        onError(error, stack);
        return Future<PictureInfo>.error(error, stack);
      });
    }
    return decoder(data, colorFilter, key.toString());
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is PostProcessedAssetSvgPicture &&
        name == other.name &&
        colorFilter == other.colorFilter &&
        processor == other.processor;
  }

  @override
  int get hashCode => hashValues(name.hashCode, colorFilter, processor);

  @override
  String toString() => '$runtimeType($name, colorFilter: $colorFilter)';
}
