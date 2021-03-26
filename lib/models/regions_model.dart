class RegionsModel {
  RegionsModel({
    this.id,
    this.regionCode,
    this.name,
    this.description,
    this.abbr,
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
  String coordX;
  String coordY;
  DateTime createdAt;
  DateTime updatedAt;

  factory RegionsModel.fromJson(Map<String, dynamic> json) => RegionsModel(
        id: json["id"],
        regionCode: json["region_code"],
        name: json["name"],
        description: json["description"],
        abbr: json["abbr"],
        coordX: json["coord_x"],
        coordY: json["coord_y"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "region_code": regionCode,
        "name": name,
        "description": description,
        "abbr": abbr,
        "coord_x": coordX,
        "coord_y": coordY,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
