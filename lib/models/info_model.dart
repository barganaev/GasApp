// To parse this JSON data, do
//
//     final infoModel = infoModelFromJson(jsonString);

import 'dart:convert';

List<InfoModel> infoModelFromJson(String str) =>
    List<InfoModel>.from(json.decode(str).map((x) => InfoModel.fromJson(x)));

String infoModelToJson(List<InfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoModel {
  InfoModel({
    this.id,
    this.type,
    this.title,
    this.text,
    this.createdDate,
    this.ip,
    this.browser,
    this.link,
    this.image,
  });

  int id;
  String type;
  String title;
  String text;
  DateTime createdDate;
  String ip;
  String browser;
  String link;
  String image;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        text: json["text"],
        createdDate: DateTime.parse(json["created_date"]),
        ip: json["ip"],
        browser: json["browser"],
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": title,
        "text": text,
        "created_date": createdDate.toIso8601String(),
        "ip": ip,
        "browser": browser,
        "link": link,
        "image": image,
      };
}
