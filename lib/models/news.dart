import 'dart:math';

enum Tag {
  politics,
  sport,
  bussiness,
  culture,
}

class News {
  String id = Random().nextInt(1500).toString();
  String imageUrl;
  String title;
  String description;
  Tag tag;
  DateTime date;
  int minRead = 5;

  News({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.tag,
    required this.date,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      imageUrl: json["imageUrl"],
      title: json["title"],
      description: json["description"],
      tag: json["tag"],
      date: json["date"],
    );
  }
}
