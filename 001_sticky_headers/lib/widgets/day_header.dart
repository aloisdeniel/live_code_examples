import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DayHeader extends StatelessWidget {
  const DayHeader({
    Key? key,
    required this.time,
    this.separator = true,
  }) : super(key: key);

  final DateTime time;
  final bool separator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final result = SizedBox(
      height: 42,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(48),
            border: Border.all(
              color: theme.secondaryHeaderColor,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Text(
            '${time.day}/${time.month}/${time.year}',
            style: theme.textTheme.caption,
          ),
        ),
      ),
    );

    if (separator) {
      return Stack(
        children: [
          const DaySeparator(),
          result,
        ],
      );
    }

    return result;
  }
}

class DaySeparator extends StatelessWidget {
  const DaySeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 42,
      child: Center(
        child: Container(
          height: 1,
          width: double.infinity,
          color: theme.secondaryHeaderColor,
        ),
      ),
    );
  }
}
