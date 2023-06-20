import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory News.fromJson(Map<String, dynamic> json) => News(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.title,
    required this.content,
    required this.author,
    required this.publish_date,
  });

  String title;
  String content;
  String author;
  DateTime publish_date;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        content: json["content"],
        author: json["author"],
        publish_date: DateTime.parse(json["publish_date"]),
      );

  Map<String, dynamic> toJson() => {
        "user": title,
        "content": content,
        "author": author,
        "date": publish_date.toIso8601String(),
      };
}
