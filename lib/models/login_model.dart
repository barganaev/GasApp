class LoginModel {
  LoginModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.code,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  int code;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
