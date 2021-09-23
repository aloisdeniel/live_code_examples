import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_icon/path_icon.dart';

import 'home_2.dart';

/// The `path_icon` package allows us to render vector based icons.
///
/// This improves performance, and allows us to animate color.
///
/// But icons should be simple vector graphics, composed of paths with a single fill color.
class HomeLayout extends StatefulWidget {
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
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool iconHover = false;
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
                  processor: HomeLayout.purpleBackgroundAndBlonde,
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
                  processor: HomeLayout.orangeBackgroundAndRed,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: MouseRegion(
                onEnter: (_) => setState(() => iconHover = true),
                onExit: (_) => setState(() => iconHover = false),
                child: AnimatedPathIcon(
                  elfIcon,
                  duration: const Duration(milliseconds: 400),
                  color: iconHover
                      ? const Color(0xFF33D79A)
                      : const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final elfIcon = PathIconData.fromSvg('''
<svg width="119" height="119" viewBox="0 0 119 119">
<path d="M47.1706 67.4283C47.6371 67.898 50.4357 70.2336 59.5463 70.2336C68.6569 70.2336 71.4556 67.898 71.922 67.425C72.7689 66.5781 72.8152 65.1622 71.9683 64.3153C71.1181 63.4685 69.7916 63.4288 68.948 64.2723C68.9282 64.2889 66.8242 65.8933 59.5463 65.8933C52.5397 65.8933 50.3266 64.408 50.1546 64.2822C49.3044 63.5181 47.991 63.5412 47.1706 64.3616C46.3237 65.2085 46.3237 66.5814 47.1706 67.4283Z" fill="black"/>
<path d="M46.3138 54.1115C44.4943 54.1115 43.0057 52.6228 43.0057 50.8034V47.4952C43.0057 45.6758 44.4943 44.1871 46.3138 44.1871C48.1333 44.1871 49.6219 45.6758 49.6219 47.4952V50.8034C49.6219 52.6228 48.1333 54.1115 46.3138 54.1115Z" fill="black"/>
<path d="M72.7788 54.1115C70.9594 54.1115 69.4707 52.6228 69.4707 50.8034V47.4952C69.4707 45.6758 70.9594 44.1871 72.7788 44.1871C74.5983 44.1871 76.0869 45.6758 76.0869 47.4952V50.8034C76.0869 52.6228 74.5983 54.1115 72.7788 54.1115Z" fill="black"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M59.5463 13.2325L59.4493 13.2326C42.9411 13.2713 26.465 23.1956 26.465 43.0056C26.465 44.7508 26.5303 46.212 26.6504 47.4236L26.465 47.24C26.465 47.24 16.5406 40.6238 16.5406 43.9319C16.5406 47.6657 21.7757 64.4943 28.7357 66.8661L27.5821 93.3996C19.2961 95.7849 13.2325 103.424 13.2325 112.476V113.612C13.2325 116.639 15.6861 119.093 18.7127 119.093H100.38C103.406 119.093 105.86 116.639 105.86 113.612V112.476C105.86 103.495 99.891 95.9047 91.7048 93.4567L90.5052 65.8671C97.0558 61.5114 102.552 47.3225 102.552 43.9319C102.552 41.4186 95.6718 44.6338 92.366 46.3238C92.4902 45.3817 92.5794 44.2816 92.6275 43.0056C92.6275 23.1744 76.1162 13.2501 59.5902 13.2325L59.5463 13.2325ZM90.3353 61.9589L89.9177 52.354L92.5199 49.7783L92.6227 49.7232C92.9328 49.5572 93.379 49.3219 93.9153 49.049C94.9959 48.4991 96.4079 47.8143 97.7959 47.2365C98.1199 47.1016 98.4299 46.978 98.7237 46.8663C98.5305 47.4732 98.2999 48.1373 98.0335 48.844C97.0824 51.3668 95.7266 54.296 94.1287 56.9391C92.8962 58.9776 91.6013 60.7092 90.3353 61.9589ZM84.0318 72.7094C83.611 79.2977 83.0119 86.2102 82.3835 92.6276H74.4678C74.3009 92.6276 74.1348 92.6352 73.9697 92.6501V84.8761C78.1415 81.9202 81.6165 77.7211 84.0318 72.7094ZM82.0708 95.7591H74.4678C74.0014 95.7591 73.4841 95.9008 72.9714 96.2098C71.6553 97.0032 69.5757 98.1714 67.2454 99.1487C64.9764 100.1 62.173 101 59.4925 100.993C56.8328 100.987 54.0537 100.088 51.8032 99.1392C49.4922 98.1649 47.4291 97.0028 46.12 96.2116C45.6066 95.9013 45.0884 95.7591 44.6211 95.7591H37.0864C37.9491 104.471 38.8238 111.951 39.3099 115.961H79.7915C80.2888 111.951 81.1844 104.471 82.0708 95.7591ZM92.6832 115.961H100.38C101.677 115.961 102.728 114.909 102.728 113.612V112.476C102.728 105.3 98.2027 99.1772 91.8505 96.8079L92.6832 115.961ZM26.6012 115.961L27.437 96.7365C20.9826 99.0524 16.3641 105.227 16.3641 112.476V113.612C16.3641 114.909 17.4156 115.961 18.7127 115.961H26.6012ZM36.7823 92.6276H44.6211C44.7892 92.6276 44.9566 92.6353 45.1229 92.6505V84.876C41.0334 81.9784 37.6135 77.8862 35.205 73.0049C35.6079 79.5042 36.1803 86.3061 36.7823 92.6276ZM34.6491 59.6117C36.1049 75.1271 47.1096 86.4525 59.5463 86.4525C60.4114 86.4525 61.2695 86.3977 62.118 86.2905C63.9776 86.0086 65.7994 85.4858 67.4352 84.8942C77.1938 80.9427 84.6066 69.8619 84.6066 56.1058C84.6066 55.2361 84.577 54.3771 84.519 53.53C84.4769 53.4172 84.4532 53.3568 84.4532 53.3568L84.5031 53.3073C84.1292 48.2848 82.7583 43.6834 80.6591 39.7391C76.2097 34.1842 70.7468 36.2213 65.8294 38.0549C63.5693 38.8977 61.4245 39.6975 59.5463 39.6975C57.668 39.6975 55.5232 38.8977 53.2631 38.0549C48.3467 36.2216 42.885 34.185 38.4362 39.7356C36.5865 43.2097 35.3018 47.1935 34.7659 51.5255C34.6378 53.9021 34.6057 56.6357 34.6491 59.6117ZM59.5874 89.6412C60.5258 89.6289 61.4615 89.5484 62.3812 89.4168C64.6833 89.1438 66.9038 88.5419 69.009 87.6512C69.5738 87.438 70.1094 87.2211 70.6098 87.008C70.6866 86.9753 70.7627 86.9426 70.8382 86.91V92.7302C65.9357 96.1898 63.1553 97.4704 59.5463 97.4704C55.9339 97.4704 53.1556 96.1921 48.2544 92.7309V87.0589L48.2565 87.0598C51.1319 88.3375 55.211 89.6986 59.5874 89.6412ZM24.4858 49.6872L29.1882 54.3418C29.0286 55.1287 28.8586 56.1312 28.7382 57.2805C28.5588 58.9923 28.4803 61.1109 28.748 63.3671C28.6339 63.2851 28.5157 63.1942 28.3929 63.0938C26.9618 61.9234 25.461 59.8148 24.0701 57.122C22.7102 54.4893 21.5892 51.5627 20.8111 49.0293C20.6135 48.386 20.4448 47.7899 20.3026 47.2475C21.3678 47.7904 22.4418 48.417 23.2814 48.9301C23.723 49.2 24.0903 49.4326 24.3451 49.5964C24.3968 49.6297 24.4438 49.66 24.4858 49.6872ZM17.4915 46.1327C17.4915 46.1327 17.5075 46.132 17.5446 46.1372C17.5109 46.1364 17.4915 46.1327 17.4915 46.1327ZM101.334 46.1372C101.334 46.1372 101.324 46.138 101.305 46.1369C101.325 46.1363 101.334 46.1372 101.334 46.1372Z" fill="black"/>
</svg>
  ''');
