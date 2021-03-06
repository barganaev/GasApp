import 'dart:convert';

import 'package:gasapp/models/add_feedback.dart';
import 'package:gasapp/models/check_login_model.dart';
import 'package:gasapp/models/info_model.dart';
import 'package:gasapp/models/list_of_stations_model.dart';
import 'package:gasapp/models/login_model.dart';
import 'package:gasapp/models/regions_model.dart';
import 'package:gasapp/models/self_station.dart';
import 'package:gasapp/models/shipment_model.dart';
import 'package:gasapp/models/stations_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> requestPost(
    String requestName, {
    String phoneNumber,
    String password,
    String regionId,
    String username,
    String email,
    String text,
    String token,
    String stationId,
    String isOpen,
    String date,
  }) async {
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
      case "addFeedbackSupport":
        var responseJson =
            await _addFeedbackSupportReq(username, email, phoneNumber, text);
        return responseJson;
        break;
      case "addFeedbackMessage":
        var responseJson =
            await _addFeedbackMessageReq(username, email, phoneNumber, text);
        return responseJson;
        break;
      case "selfStation":
        var responseJson = await _selfStationReq(token, regionId);
        return responseJson;
        break;
      case "logStation":
        var responseJson = await _switcherReq(token, stationId, isOpen);
        return responseJson;
        break;
      case "planShipment":
        var responseJson = await _shipmentReq(regionId, date);
        return responseJson;
        break;
      default:
        print("JAKE JAKS");
        return Exception();
      // throw Exception();
    }
  }

  Future _shipmentReq(String regionId, String date) async {
    final String _baseUrl =
        "https://agzs.process.kz/api/public/api/planShipment";
    String requestName = "planShipment";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'region_id': regionId,
          'date': date,
        }),
      );
      print(response.statusCode);
      print(response.body);
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
  }

  Future _switcherReq(String token, String stationId, String isOpen) async {
    final String _baseUrl = "https://agzs.process.kz/api/public/api/logStation";
    String requestName = "logStation";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'token': token,
          'station_id': stationId,
          'is_open': isOpen,
        }),
      );
      print(response.statusCode);
      print(response.body);
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
  }

  Future _selfStationReq(String token, String regionId) async {
    final String _baseUrl =
        "https://agzs.process.kz/api/public/api/selfStation";
    String requestName = "selfStation";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'token': token,
          'region_id': regionId,
        }),
      );
      print(response.statusCode);
      print(response.body);
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
  }

  Future _addFeedbackMessageReq(
      String username, String email, String phone, String text) async {
    final String _baseUrl =
        "https://agzs.process.kz/api/public/api/addFeedbackMessage";
    String requestName = "addFeedbackMessage";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'phone': phone,
          'text': text,
        }),
      );
      print(response.statusCode);
      print(response.body);
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
  }

  Future _addFeedbackSupportReq(
      String username, String email, String phone, String text) async {
    final String _baseUrl =
        "https://agzs.process.kz/api/public/api/addFeedbackSupport";
    String requestName = "addFeedbackSupport";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'phone': phone,
          'text': text,
        }),
      );
      print(response.statusCode);
      print(response.body);
      responseJson = _response(response, requestName);
    } catch (e) {}
    return responseJson;
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
      //return Exception();
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
        } else if (requestname == "addFeedbackSupport") {
          final addFeedback = addFeedbackFromJson(response.body);
          return addFeedback;
        } else if (requestname == "addFeedbackMessage") {
          final addFeedback = addFeedbackFromJson(response.body);
          return addFeedback;
        } else if (requestname == "selfStation") {
          print(json.decode(response.body));
          final selfStation = selfStationModelFromJson(response.body);
          return selfStation;
        } else if (requestname == "logStation") {
          print(json.decode(response.body));
          final switcher = addFeedbackFromJson(response.body);
          return switcher;
        } else if (requestname == "planShipment") {
          print(json.decode(response.body));
          final shipment = shipmentModelFromJson(response.body);
          return shipment;
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
