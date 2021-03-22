import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gasapp/models/cities_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoWindowModel extends ChangeNotifier {
  bool _showInfoWindow = false;
  bool _tempHidden = false;
  City _city;
  double _leftMargin;
  double _topMargin;

  void rebuildInfoWindow(){
    notifyListeners();
  }

  void updateCity(City city){
    _city = city;
  }

  void updateVisibility(bool visibility){
    _showInfoWindow = visibility;
  }

  void updateInfoWindow(BuildContext context, GoogleMapController controller, LatLng location, double infoWindowWidth, double markerOffset) async {
    ScreenCoordinate screenCoordinate = await controller.getScreenCoordinate(location);
    double devicePixelRatio = Platform.isAndroid ? MediaQuery.of(context).devicePixelRatio : 1.0;
    double left = (screenCoordinate.x.toDouble() / devicePixelRatio) - (infoWindowWidth / 2);
    double top = (screenCoordinate.x.toDouble() / devicePixelRatio) - markerOffset;

    if(left < 0 || top < 0){
      _tempHidden = true;
    }else{
      _tempHidden = false;
      _leftMargin = left;
      _topMargin = top;
    }
  }

  bool get showInfoWindow => (_showInfoWindow == true && _tempHidden == false) ? true : false;

  double get leftMargin => _leftMargin;
  double get topMargin => _topMargin;
  City get city => _city;
}