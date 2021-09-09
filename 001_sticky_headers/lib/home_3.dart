import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sticky_headers_example/widgets/day_header.dart';

import 'data/data.dart';
import 'widgets/message_tile.dart';

/// With the `overlapsContent`, we're now able to put our headers on top
/// of our separators!
class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ...data.messagesByDay.map(
            (section) => SliverStickyHeader(
              overlapsContent: true,
              header: DayHeader(
                time: section.key,
                separator: false,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => index == 0
                      ? const DaySeparator()
                      : MessageTile(
                          message: section.value[index - 1],
                        ),
                  childCount: section.value.length + 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
