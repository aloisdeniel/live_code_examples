import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pravatar/flutter_pravatar.dart';
import 'package:sticky_headers_example/data/data.dart';

class UserPicture extends StatelessWidget {
  const UserPicture({
    Key? key,
    required this.user,
    this.size = 36,
  }) : super(key: key);

  final User user;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipSmoothRect(
      radius: SmoothBorderRadius(
        cornerRadius: 4.0,
      ),
      child: Container(
        color: theme.hintColor,
        width: size,
        height: size,
        child: Pravatar.uniqueId(user.id.toString()),
      ),
    );
  }
}
