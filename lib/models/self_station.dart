// To parse this JSON data, do
//
//     final selfStationModel = selfStationModelFromJson(jsonString);

import 'dart:convert';

SelfStationModel selfStationModelFromJson(String str) =>
    SelfStationModel.fromJson(json.decode(str));

String selfStationModelToJson(SelfStationModel data) =>
    json.encode(data.toJson());

class SelfStationModel {
  SelfStationModel({
    this.message,
  });

  List<Message> message;

  factory SelfStationModel.fromJson(Map<String, dynamic> json) =>
      SelfStationModel(
        message:
            List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    this.id,
    this.regionId,
    this.companyId,
    this.name,
    this.comment,
    this.isOpen,
    this.coordX,
    this.coordY,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.lastInsertedId,
    this.boss,
    this.address,
    this.gsoId,
    this.user_name,
    this.email,
    this.phone_number,
  });

  int id;
  String regionId;
  String companyId;
  String name;
  String comment;
  String isOpen;
  String coordX;
  String coordY;
  DateTime createdAt;
  String updatedAt;
  String status;
  String lastInsertedId;
  String boss;
  String address;
  String gsoId;
  String user_name;
  String email;
  String phone_number;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        regionId: json["region_id"],
        companyId: json["company_id"],
        name: json["name"],
        comment: json["comment"],
        isOpen: json["is_open"],
        coordX: json["coord_x"],
        coordY: json["coord_y"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        status: json["status"],
        lastInsertedId: json["last_inserted_id"],
        boss: json["boss"],
        address: json["address"],
        gsoId: json["gso_id"],
        user_name: json["user_name"] ?? " ",
        email: json["email"] ?? " ",
        phone_number: json["phone_number"] ?? " ",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "region_id": regionId,
        "company_id": companyId,
        "name": name,
        "comment": comment,
        "is_open": isOpen,
        "coord_x": coordX,
        "coord_y": coordY,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "status": status,
        "last_inserted_id": lastInsertedId,
        "boss": boss,
        "address": address,
        "gso_id": gsoId,
      };
}
