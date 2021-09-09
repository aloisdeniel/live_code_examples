import 'dart:math';

import 'package:faker/faker.dart';
import 'package:collection/collection.dart';

final data = Data.generate();

class Data {
  const Data({
    required this.messages,
  });

  factory Data.generate() {
    final users = <User>[
      for (var i = 0; i < 10; i++) User.generate(i),
    ];

    final random = Random();
    return Data(
      messages: [
        for (var i = 0; i < 200; i++)
          Message.generate(
            id: i,
            user: users[random.nextInt(users.length)],
          ),
      ],
    );
  }

  final List<Message> messages;

  List<MapEntry<DateTime, List<Message>>> get messagesByDay =>
      groupBy<Message, DateTime>(
        messages,
        (x) => DateTime(
          x.time.year,
          x.time.month,
          x.time.day,
        ),
      ).entries.toList()
        ..sort(
          (x, y) => x.key.compareTo(y.key),
        );
}

class Message {
  const Message({
    required this.id,
    required this.user,
    required this.time,
    required this.message,
  });

  factory Message.generate({
    required int id,
    required User user,
  }) =>
      Message(
        id: id,
        user: user,
        time: DateTime.now().add(Duration(minutes: id * -200)),
        message: faker.lorem.sentences(3).join(' '),
      );

  final int id;
  final User user;
  final DateTime time;
  final String message;
}

class User {
  const User({
    required this.id,
    required this.name,
  });

  factory User.generate(int id) => User(id: id, name: faker.person.name());

  final int id;
  final String name;
}
