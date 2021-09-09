import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sticky_headers_example/data/data.dart';

import 'user_picture.dart';

class MessageTile extends StatelessWidget {
  MessageTile({
    required this.message,
  }) : super(key: ValueKey(message.id));

  final Message message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserPicture(
            key: key!,
            user: message.user,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      message.user.name,
                      style: theme.textTheme.button,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        '${message.time.hour}h${message.time.minute}',
                        style: theme.textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.w200,
                          color: Colors.white54,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  message.message,
                  style: theme.textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
