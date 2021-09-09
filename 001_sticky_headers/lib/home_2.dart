import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sticky_headers_example/widgets/day_header.dart';

import 'data/data.dart';
import 'widgets/message_tile.dart';

/// Thanks to flutter_sticky_header, we can pin hour headers to the top
/// of the list.
///
/// But we have one remaining issue : the line should scroll...
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
              header: DayHeader(
                time: section.key,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => MessageTile(
                    message: section.value[index],
                  ),
                  childCount: section.value.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
