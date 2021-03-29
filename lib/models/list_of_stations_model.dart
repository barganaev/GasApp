// To parse this JSON data, do
//
//     final listOfStationsModel = listOfStationsModelFromJson(jsonString);

import 'dart:convert';

List<ListOfStationsModel> listOfStationsModelFromJson(String str) =>
    List<ListOfStationsModel>.from(
        json.decode(str).map((x) => ListOfStationsModel.fromJson(x)));

String listOfStationsModelToJson(List<ListOfStationsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListOfStationsModel {
  ListOfStationsModel({
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
    this.boss,
    this.address,
    this.gsoId,
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
  String status;
  String boss;
  String address;
  String gsoId;

  factory ListOfStationsModel.fromJson(Map<String, dynamic> json) =>
      ListOfStationsModel(
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
        status: json["status"],
        boss: json["boss"],
        address: json["address"],
        gsoId: json["gso_id"],
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
        "status": status,
        "boss": boss,
        "address": address,
        "gso_id": gsoId,
      };
}
