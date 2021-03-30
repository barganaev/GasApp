import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:gasapp/utils/cur_position.dart';
import 'package:gasapp/utils/utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ShowInMapScreen extends StatefulWidget {
  double x;
  double y;
  ShowInMapScreen({this.x, this.y});
  @override
  _ShowInMapScreenState createState() => _ShowInMapScreenState();
}

class _ShowInMapScreenState extends State<ShowInMapScreen> {

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  Future<void> curLocation() async {
    Position position = await determinePosition();
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
    new CameraPosition(target: LatLng(widget.x, widget.y), zoom: 13);

    mapController = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(mapStyle);
    _controller.complete(controller);
    await curLocation();
  }

  bool mapTypeNormal = true;

 //LatLng latLatPosition = LatLng(43.653482, 51.178438);

  Set<Marker> markers(BuildContext context) {
    Set<Marker> markers = {};
      markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(widget.x, widget.y),
          // icon: widget.list[i - 1].isOpen == "0"
          //     ? widget.customIconNotActive
          //     : widget.customIconActive,
          // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    print('show map');
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
            myLocationButtonEnabled: false,
            markers: markers(context),
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: LatLng(widget.x, widget.y), zoom: 13),
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
