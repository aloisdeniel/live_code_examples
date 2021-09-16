import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'data/data.dart';
import 'widgets/content.dart';
import 'widgets/sheet.dart';

/// The [AnimatedSize] make the size dynamically change whenever its child changes.
///
/// Make sure to have unique [Key]s.
class HomeLayout extends StatefulWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sheet.center(
        child: AnimatedSize(
          duration: const Duration(
            milliseconds: 200,
          ),
          child: ContentPage(
            data.contents[currentPage],
            onNext: () => setState(
              () => currentPage = (currentPage + 1) % data.contents.length,
            ),
            onPrevious: () => setState(
              () => currentPage = (currentPage == 0)
                  ? data.contents.length - 1
                  : currentPage - 1,
            ),
          ),
        ),
      ),
    );
  }
}
