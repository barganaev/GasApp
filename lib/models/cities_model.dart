import 'dart:convert';

Cities citiesFromJson(String str) => Cities.fromJson(json.decode(str));

String citiesToJson(Cities data) => json.encode(data.toJson());

class Cities {
  Cities({
    this.cities,
  });

  List<Map<String, List<Map<String, List<City>>>>> cities;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
    cities: List<Map<String, List<Map<String, List<City>>>>>.from(json["cities"].map((x) => Map.from(x).map((k, v) => MapEntry<String, List<Map<String, List<City>>>>(k, List<Map<String, List<City>>>.from(v.map((x) => Map.from(x).map((k, v) => MapEntry<String, List<City>>(k, List<City>.from(v.map((x) => City.fromJson(x))))))))))),
  );

  Map<String, dynamic> toJson() => {
    "cities": List<dynamic>.from(cities.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))))))))),
  };
}

class City {
  City({
    //this.latLng,
    this.isActive,
    this.lon,
    this.lat,
    this.title,
    this.date,
  });

  //LatLng latLng;
  bool isActive;
  double lon;
  double lat;
  String title;
  String date;

  factory City.fromJson(Map<String, dynamic> json) => City(
    isActive: json["isActive"],
    lon: json["lon"].toDouble(),
    lat: json["lat"].toDouble(),
    title: json["title"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "isActive": isActive,
    "lon": lon,
    "lat": lat,
    "title": title,
    "date": date,
  };
}
