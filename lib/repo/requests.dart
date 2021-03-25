import 'dart:convert';

import 'package:gasapp/models/check_login_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> requestPost(String requestName, {String phoneNumber}) async {
    switch (requestName) {
      case "check":
        var responseJson = await _checkReq(phoneNumber);
        return responseJson;
        break;
      default:
        throw Exception();
    }
  }

  Future _checkReq(String phoneNumber) async {
    final String _baseUrl = "https://agzs.process.kz/api/public/api/check";
    String requestName = "check";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phone_number': phoneNumber,
        }),
      );
      // await Future.delayed(const Duration(seconds: 3));
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
  }

  dynamic _response(http.Response response, String requestname) {
    switch (response.statusCode) {
      case 200:
        if (requestname == "check") {
          var responseJson = json.decode(response.body);
          CheckModule _checkModule = CheckModule.fromJson(responseJson);
          return _checkModule;
        }
        //TODO if else
        break;
      // case 400:

      //   throw Exception();
      // // throw BadRequestException(response.body.toString());
      // case 401:
      //   throw Exception();
      // case 403:
      // // throw UnauthorisedException(response.body.toString());
      // case 500:
      //   throw Exception();
      default:
        throw Exception();
    }
  }
}
