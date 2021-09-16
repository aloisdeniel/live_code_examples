import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'data/data.dart';
import 'widgets/content.dart';
import 'widgets/sheet.dart';

/// By adding an [AnimatedSwitcher]  a fading transition is visible each time its
/// child changes.
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
    const duration = Duration(
      milliseconds: 200,
    );
    final content = data.contents[currentPage];
    return Scaffold(
      body: Sheet.center(
        child: AnimatedSize(
          alignment: Alignment.bottomCenter,
          duration: duration,
          child: AnimatedSwitcher(
            duration: duration,
            child: ContentPage(
              content,
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
      ),
    );
  }
}
