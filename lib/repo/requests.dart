import 'dart:convert';

import 'package:gasapp/models/check_login_model.dart';
import 'package:gasapp/models/info_model.dart';
import 'package:gasapp/models/list_of_stations_model.dart';
import 'package:gasapp/models/login_model.dart';
import 'package:gasapp/models/regions_model.dart';
import 'package:gasapp/models/stations_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> requestPost(String requestName,
      {String phoneNumber, String password, String regionId}) async {
    switch (requestName) {
      case "check":
        var responseJson = await _checkReq(phoneNumber);
        return responseJson;
        break;
      case "login":
        var responseJson = await _loginReq(phoneNumber, password);
        return responseJson;
        break;
      case "regions":
        var responseJson = await _regionsReq();
        return responseJson;
        break;
      case "stations":
        var responseJson = await _stationsReq();
        return responseJson;
        break;
      case "information":
        var responseJson = await _infoReq();
        return responseJson;
        break;
      case "listOfStations":
        var responseJson = await _listOfStationsReq(regionId);
        return responseJson;
        break;
      default:
        print("JAKE JAKS");
        return Exception();
      // throw Exception();
    }
  }

  Future _listOfStationsReq(String regionId) async {
    final String _baseUrl =
        "https://agzs.process.kz/api/public/api/listOfStations";
    String requestName = "listOfStations";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'region_id': regionId,
        }),
      );
      print(response.statusCode);
      print(response.body);
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
  }

  Future _infoReq() async {
    final String _baseUrl =
        "https://agzs.process.kz/api/public/api/information";
    String requestName = "information";
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      responseJson = _response(response, requestName);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future _stationsReq() async {
    final String _baseUrl = "https://agzs.process.kz/api/public/api/stations";
    String requestName = "stations";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{}),
      );
      print(response.statusCode);
      print(response.body);
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
  }

  Future _regionsReq() async {
    final String _baseUrl = "https://agzs.process.kz/api/public/api/regions";
    String requestName = "regions";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{}),
      );
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
  }

  Future _loginReq(String phoneNumber, String password) async {
    final String _baseUrl = "https://agzs.process.kz/api/public/api/login";
    String requestName = "login";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phone_number': phoneNumber,
          'password': password,
        }),
      );
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
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
        } else if (requestname == "login") {
          var responseJson = json.decode(response.body);
          LoginModel _loginModel = LoginModel.fromJson(responseJson);
          return _loginModel;
        } else if (requestname == "regions") {
          final regionsModel = regionsModelFromJson(response.body);
          // var responseJson = json.decode(response.body);
          // RegionsModel regionsModel = RegionsModel.fromJson(responseJson);
          return regionsModel;
        } else if (requestname == "stations") {
          // var responseJson = json.decode(response.body);
          List<StationsModel> stationsModel =
              stationsModelFromJson(response.body);
          return stationsModel;
        } else if (requestname == "information") {
          print(response.body);
          final infoModel = infoModelFromJson(response.body);
          return infoModel;
        } else if (requestname == "listOfStations") {
          final listModel = listOfStationsModelFromJson(response.body);
          return listModel;
        }
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
