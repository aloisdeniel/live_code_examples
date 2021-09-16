import 'package:animated_size_switcher/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContentPage extends StatelessWidget {
  ContentPage(
    this.content, {
    required this.onNext,
    required this.onPrevious,
  }) : super(
          key: ValueKey(content.id),
        );

  final Content content;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content.title,
          style: theme.textTheme.headline6,
        ),
        const SizedBox(height: 12),
        Text(content.text),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: onPrevious,
              child: const Text('Previous'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: onNext,
              child: const Text('Next'),
            ),
          ],
        )
      ],
    );
  }
}
