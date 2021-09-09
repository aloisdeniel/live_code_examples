import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sticky_headers_example/widgets/day_header.dart';
import 'package:sticky_headers_example/widgets/message_tile.dart';

import 'data/data.dart';

/// We switched implementation for a [CustomScrollView] and slivers.
///
/// This will give us more control on sections and can allow to wrap
/// slivers around sub lists for examples.
class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ...data.messagesByDay
              .map(
                (section) => [
                  SliverToBoxAdapter(
                    child: DayHeader(time: section.key),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          MessageTile(message: section.value[index]),
                      childCount: section.value.length,
                    ),
                  ),
                ],
              )
              .expand((x) => x),
        ],
      ),
    );
  }
}
