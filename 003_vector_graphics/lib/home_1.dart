import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// An SVG image file describe all rendering operations in an XML format.
///
/// This means that the image won't lose quality, at the cost of more processor intensive operations.
class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

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
        ],
      ),
    );
  }
}
