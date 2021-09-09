import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sticky_headers_example/widgets/day_header.dart';
import 'package:sticky_headers_example/widgets/message_tile.dart';

import 'data/data.dart';

/// Here we have a starting point, with a list of messages
/// and headers that aren't sticky at all.
///
/// We're using a simple [ListView] with for and spread operators.
class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var section in data.messagesByDay) ...[
            DayHeader(time: section.key),
            for (var message in section.value)
              MessageTile(
                message: message,
              ),
          ],
        ],
      ),
    );
  }
}
