import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'data/data.dart';
import 'widgets/content.dart';
import 'widgets/sheet.dart';

/// A bonus tip : the `shrinkWrap` property for [ListView]s. to make things scrollable when the content
/// is overflown,
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
          duration: duration,
          alignment: Alignment.bottomCenter,
          child: AnimatedSwitcher(
            duration: duration,
            layoutBuilder: (currentChild, previousChildren) => Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            ),
            child: ListView(
              key: ValueKey(currentPage),
              reverse: true,
              shrinkWrap: true,
              children: [
                ContentPage(
                  content,
                  onNext: () => setState(
                    () =>
                        currentPage = (currentPage + 1) % data.contents.length,
                  ),
                  onPrevious: () => setState(
                    () => currentPage = (currentPage == 0)
                        ? data.contents.length - 1
                        : currentPage - 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
