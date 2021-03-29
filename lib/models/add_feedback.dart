// To parse this JSON data, do
//
//     final addFeedback = addFeedbackFromJson(jsonString);

import 'dart:convert';

AddFeedbackModule addFeedbackFromJson(String str) =>
    AddFeedbackModule.fromJson(json.decode(str));

String addFeedbackToJson(AddFeedbackModule data) => json.encode(data.toJson());

class AddFeedbackModule {
  AddFeedbackModule({
    this.message,
    this.code,
  });

  String message;
  int code;

  factory AddFeedbackModule.fromJson(Map<String, dynamic> json) =>
      AddFeedbackModule(
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
      };
}
