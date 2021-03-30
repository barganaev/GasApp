// To parse this JSON data, do
//
//     final regionsModel = regionsModelFromJson(jsonString);

import 'dart:convert';

List<RegionsModel> regionsModelFromJson(String str) => List<RegionsModel>.from(
    json.decode(str).map((x) => RegionsModel.fromJson(x)));

String regionsModelToJson(List<RegionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegionsModel {
  RegionsModel({
    this.id,
    this.regionCode,
    this.name,
    this.description,
    this.abbr,
    this.excelSheetName,
    this.coordX,
    this.coordY,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String regionCode;
  String name;
  String description;
  String abbr;
  String excelSheetName;
  String coordX;
  String coordY;
  String createdAt;
  String updatedAt;

  factory RegionsModel.fromJson(Map<String, dynamic> json) => RegionsModel(
        id: json["id"],
        regionCode: json["region_code"],
        name: json["name"],
        description: json["description"],
        abbr: json["abbr"],
        excelSheetName: json["excel_sheet_name"],
        coordX: json["coord_x"],
        coordY: json["coord_y"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "region_code": regionCode,
        "name": name,
        "description": description,
        "abbr": abbr,
        "excel_sheet_name": excelSheetName,
        "coord_x": coordX,
        "coord_y": coordY,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
