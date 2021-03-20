import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gasapp/utils/cur_position.dart';
import 'package:gasapp/login.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<String> cities = [
  'Ақтау қаласы',
  'Жаңаөзен қаласы',
  'Құрық ауданы',
  'Бейнеу ауданы'
];

List<CameraPosition> positions = [
  CameraPosition(
    target: LatLng(43.655357, 51.156099),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(43.342015, 52.857237),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(43.178096, 51.680373),
    zoom: 14,
  ),
  CameraPosition(
    target: LatLng(45.307847, 55.183664),
    zoom: 13,
  ),
];

Set<Marker> _markers = {
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.667631, 51.150840),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  )
};

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  bool mapTypeHybrid = true;

  int indexOfCity = 0;
  String selectedCountry = 'Ақтау қаласы';
  String selectedProvince;

  @override
  void initState() {
    super.initState();
  }

  void onChangedCallback(city) async {
    selectedCountry = city;
    for (int i = 0; i < cities.length; i++) {
      if (city == cities[i]) {
        setState(() {
          indexOfCity = i;
        });
      }
    }
    mapController = await _controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(positions[indexOfCity]),
    );
  }

  Future<void> curLocation() async {
    Position position = await determinePosition();
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 14);

    mapController = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(Utils.mapStyle);
    _controller.complete(controller);
    await curLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: DropdownButton<String>(
          dropdownColor: Colors.lightBlue,
          value: selectedCountry,
          items: cities.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: onChangedCallback,
        ),
      ),
      drawer: HomeDrawer(),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: mapTypeHybrid ? MapType.hybrid : MapType.normal,
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: positions[indexOfCity],
        mapToolbarEnabled: true,
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mapTypeHybrid = !mapTypeHybrid;
          });
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.map),
      ),
    );
  }
}

class Utils {
  static String mapStyle = '''
  [
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
  ]
  ''';
}

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LogIn()));
        },
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 8),
          // color: HexColor("#31343E"),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  "assets/account_photo_default.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Name Surname\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Colors.black87)),
                  TextSpan(
                      text: "@username",
                      style: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.black54)),
                ]),
              ),
            ],
          ),
        ),
      ),
      Divider(height: 1, thickness: 1, color: Colors.blueGrey[900]),
      Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            // List items goes here...
          ],
        ),
      ),
    ]));
  }
}
