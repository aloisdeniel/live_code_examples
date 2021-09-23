import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Here we use a rasterized image which consists basically of a matrix of pixels.
///
/// These type of image potentially takes a lot of memory, but is easy to process and to render for the CPU.
///
/// Variations for pixel densities should be provided, and the image's qulity becomes worst as the image is scrolled.
class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Image.asset(
          'assets/elf.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
