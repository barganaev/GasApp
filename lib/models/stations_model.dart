// To parse this JSON data, do
//
//     final stationsModel = stationsModelFromJson(jsonString);

import 'dart:convert';

List<StationsModel> stationsModelFromJson(String str) =>
    List<StationsModel>.from(
        json.decode(str).map((x) => StationsModel.fromJson(x)));

String stationsModelToJson(List<StationsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StationsModel {
  StationsModel({
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
  });

  int id;
  String regionId;
  String companyId;
  String name;
  String comment;
  String isOpen;
  String coordX;
  String coordY;
  String createdAt;
  String updatedAt;

  factory StationsModel.fromJson(Map<String, dynamic> json) => StationsModel(
        id: json["id"],
        regionId: json["region_id"],
        companyId: json["company_id"],
        name: json["name"],
        comment: json["comment"],
        isOpen: json["is_open"],
        coordX: json["coord_x"],
        coordY: json["coord_y"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
