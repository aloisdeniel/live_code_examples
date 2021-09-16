import 'dart:math';

import 'package:faker/faker.dart';

final data = Data.generate();

class Data {
  const Data({
    required this.contents,
  });

  factory Data.generate() {
    final random = Random();
    return Data(
      contents: [
        for (var i = 0; i < 200; i++)
          Content.generate(
            id: i,
            sentences: 3 + random.nextInt(4),
          ),
      ],
    );
  }

  final List<Content> contents;
}

class Content {
  const Content({
    required this.id,
    required this.text,
    required this.title,
  });

  factory Content.generate({
    required int id,
    required int sentences,
  }) =>
      Content(
        id: id,
        title: faker.lorem.words(10).join(' '),
        text: faker.lorem.sentences(sentences).join(' '),
      );

  final int id;
  final String title;
  final String text;
}
