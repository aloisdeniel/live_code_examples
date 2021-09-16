import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SheetPosition {
  center,
  bottom,
}

class Sheet extends StatelessWidget {
  const Sheet.center({
    Key? key,
    required this.child,
  })  : position = SheetPosition.center,
        super(key: key);

  const Sheet.bottom({
    Key? key,
    required this.child,
  })  : position = SheetPosition.bottom,
        super(key: key);

  final SheetPosition position;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const spacing = 32.0;
    const radius = SmoothRadius(
      cornerRadius: 8,
      cornerSmoothing: 1,
    );

    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(spacing),
          padding: const EdgeInsets.all(spacing),
          decoration: ShapeDecoration(
            color: theme.cardColor,
            shadows: const [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black12,
              )
            ],
            shape: const SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.all(radius),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
