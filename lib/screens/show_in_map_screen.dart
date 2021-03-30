import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:gasapp/utils/cur_position.dart';
import 'package:gasapp/utils/utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ShowInMapScreen extends StatefulWidget {
  @override
  _ShowInMapScreenState createState() => _ShowInMapScreenState();
}

class _ShowInMapScreenState extends State<ShowInMapScreen> {

  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  static  LatLng _lastMapPosition = _initialPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      // print('${placemark[0].name}');
    });
  }

  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  Future<void> curLocation() async {
    Position position = await determinePosition();
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
    new CameraPosition(target: latLatPosition, zoom: 13);

    mapController = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(mapStyle);
    _controller.complete(controller);
    await curLocation();
  }

  bool mapTypeNormal = true;

 LatLng latLatPosition = LatLng(43.653482, 51.178438);

  // Set<Marker> markers(BuildContext context) {
  //   Set<Marker> markers = {};
  //   for (int i = 1; i <= widget.list.length; i++) {
  //     markers.add(
  //       Marker(
  //         markerId: MarkerId('id-$i'),
  //         position: LatLng(
  //           double.parse(widget.list[i - 1].coordX),
  //           double.parse(widget.list[i - 1].coordY),
  //         ),
  //         icon: widget.list[i - 1].isOpen == "0"
  //             ? widget.customIconNotActive
  //             : widget.customIconActive,
  //         // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //       ),
  //     );
  //   }
  //   return markers;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
              mapTypeNormal =! mapTypeNormal;
          });
        },
        child: Icon(Icons.map),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            // markers: markers(context),
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _initialPosition, zoom: 13),
            mapType: mapTypeNormal ? MapType.normal : MapType.hybrid,
            zoomControlsEnabled: true,
            mapToolbarEnabled: false,
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize(context).height * 0.05),
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
    );
  }
}
