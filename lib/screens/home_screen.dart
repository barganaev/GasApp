import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //MapType _currentMapType = MapType.normal;

  List<String> countries = ['Ақтау қаласы', 'Жаңаөзен қаласы', 'Құрық ауданы', 'Бейнеу ауданы'];

  String selectedCountry = 'Ақтау қаласы';
  String selectedProvince;

  void onChangedCallback(country) {
    setState(() {
      selectedCountry = country;
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
                style: TextStyle(
                    color: Colors.white
                ),
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
            //mapType: _currentMapType,
            initialCameraPosition: CameraPosition(
              target: LatLng(43.6331836, 51.1596614),
              zoom: 14,
            ),
          ),
        ],
      ),
    );
  }
}








class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(
        children: <Widget>[
          Container(padding: EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 8),
            // color: HexColor("#31343E"),
            color: Colors.white,
            child:Row(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset("assets/gas_station.jpg", width: 80, height: 80, fit: BoxFit.fill,),
              ),
              SizedBox(width: 8,),
              RichText(text: TextSpan(children: [
                TextSpan(text: "Name Surname\n", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.black87)),
                TextSpan(text: "@username", style: TextStyle(fontFamily: 'Montserrat', color: Colors.black54)),
              ]),),
            ],),
          ),
          Divider(height: 1, thickness: 1, color: Colors.blueGrey[900] ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(children: <Widget>[
              // List items goes here...
            ],),
          ),
        ]
    )
    );
  }
}
