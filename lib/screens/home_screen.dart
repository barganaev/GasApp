import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> countries = [
    'Ақтау қаласы',
    'Жаңаөзен қаласы',
    'Құрық ауданы',
    'Бейнеу ауданы'
  ];

  String selectedCountry = 'Ақтау қаласы';
  String selectedProvince;

  void onChangedCallback(country) {
    setState(() {
      selectedCountry = country;
    });
  }

  Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(43.667631, 51.150840),
      infoWindow: InfoWindow(title: 'GAS', snippet: 'AZS'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    )
  };
  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(43.669088, 51.144834),
          infoWindow: InfoWindow(
            anchor: Offset(0.5, 0.5),
            title: 'Shakabayev Assan',
            snippet: '''Flutter Developer
            1 year experience
            ''',
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    });
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
          items: countries.map((String value) {
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
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(43.655357, 51.156099),
              zoom: 13,
            ),
            mapToolbarEnabled: false,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.9,
                //color: Colors.white,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Where are you going to?',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                )),
          ),
        ],
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
      Container(
        padding: EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 8),
        // color: HexColor("#31343E"),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                "assets/gas_station.jpg",
                width: 80,
                height: 80,
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
