import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'data/data.dart';
import 'widgets/content.dart';
import 'widgets/sheet.dart';

/// Here we have a starting point, with a set of pages that updates the sheet child.
///
/// There's no animation when switching from one page to another.
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
        child: ContentPage(
          data.contents[currentPage],
          onNext: () => setState(
            () => currentPage = (currentPage + 1) % data.contents.length,
          ),
          onPrevious: () => setState(
            () => currentPage =
                (currentPage == 0) ? data.contents.length - 1 : currentPage - 1,
          ),
        ),
      ),
    );
  }
}
