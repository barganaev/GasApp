import 'dart:convert';

CheckModule checkModuleFromJson(String str) =>
    CheckModule.fromJson(json.decode(str));

String checkModuleToJson(CheckModule data) => json.encode(data.toJson());

class CheckModule {
  CheckModule({
    this.status,
    this.message,
  });

  int status;
  String message;

  factory CheckModule.fromJson(Map<String, dynamic> json) => CheckModule(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
