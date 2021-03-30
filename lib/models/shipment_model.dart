// To parse this JSON data, do
//
//     final shipmentModel = shipmentModelFromJson(jsonString);

import 'dart:convert';

ShipmentModel shipmentModelFromJson(String str) =>
    ShipmentModel.fromJson(json.decode(str));

String shipmentModelToJson(ShipmentModel data) => json.encode(data.toJson());

class ShipmentModel {
  ShipmentModel({
    this.message,
  });

  List<Message> message;

  factory ShipmentModel.fromJson(Map<String, dynamic> json) => ShipmentModel(
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
    this.companyType,
    this.name,
    this.tonna,
    this.date,
    this.regionId,
    this.isEtp,
  });

  String id;
  String companyType;
  String name;
  String tonna;
  String date;
  String regionId;
  String isEtp;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        companyType: json["company_type"],
        name: json["name"],
        tonna: json["tonna"],
        date: json["date"],
        regionId: json["region_id"],
        isEtp: json["is_etp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_type": companyType,
        "name": name,
        "tonna": tonna,
        "date": date,
        "region_id": regionId,
        "is_etp": isEtp,
      };
}
