// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

List<Photo> photoFromJson(String str) =>
    List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));

String photoToJson(List<Photo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photo {
  Photo({
    required this.id,
    required this.url,
    required this.topicId,
  });

  String id;
  String url;
  String topicId;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        url: json["url"],
        topicId: json["topicId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "topicId": topicId,
      };
}
