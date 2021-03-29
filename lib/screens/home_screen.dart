import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/info_bloc/info_bloc.dart';
import 'package:gasapp/blocs/map_bloc/map_bloc.dart';
import 'package:gasapp/models/stations_model.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:gasapp/utils/cur_position.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gasapp/utils/utils.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  final List<StationsModel> list;
  final BitmapDescriptor customIconActive;
  final BitmapDescriptor customIconNotActive;

  HomeScreen(
      {@required this.list, this.customIconActive, this.customIconNotActive});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  bool mapTypeNormal = true;

  int indexOfCity = 0;
  String selectedCountry = 'город Актау';
  String selectedProvince;

  BitmapDescriptor pinLocationIcon;

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
        new CameraPosition(target: latLatPosition, zoom: 13);

    mapController = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(mapStyle);
    _controller.complete(controller);
    await curLocation();
  }

  void getBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ASAN GAS",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("Address"),
                  ),
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("27a - 14"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("Work Time"),
                  ),
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("10:00 - 22:00"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("Status"),
                  ),
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("Gaz bar"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("Объем запаса"),
                  ),
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("10 тонна"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenSize(context).width * 0.4,
                    child:
                        Text("Ориентировочные даты, в котовых газ должен быть"),
                  ),
                  Container(
                    width: screenSize(context).width * 0.4,
                    child: Text("25.03 - 22.04"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Set<Marker> markers(BuildContext context) {
    Set<Marker> markers = {};
    for (int i = 1; i <= widget.list.length; i++) {
      markers.add(
        Marker(
          onTap: () {
            getBottomSheet(context);
          },
          markerId: MarkerId('id-$i'),
          position: LatLng(
            double.parse(widget.list[i - 1].coordX),
            double.parse(widget.list[i - 1].coordY),
          ),
          icon: widget.list[i - 1].isOpen == "0"
              ? widget.customIconNotActive
              : widget.customIconActive,
          // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    print('here2');
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.lightBlue, //lightBlue,
      //   title: DropdownButton<String>(
      //     dropdownColor: Colors.lightBlue,
      //     value: selectedCountry,
      //     items: cities.map((String value) {
      //       return DropdownMenuItem<String>(
      //         value: value,
      //         child: Text(
      //           value,
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       );
      //     }).toList(),
      //     onChanged: onChangedCallback,
      //   ),
      // ),
      backgroundColor: Colors.white,
      drawer: BlocProvider<InfoBloc>.value(
        value: BlocProvider.of<InfoBloc>(context),
        // create: (context) => InfoBloc()..add(InfoGetEvent()),
        child: HomeDrawer(),
      ),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapLoadedState) {
            return Stack(
              children: [
                GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: mapTypeNormal ? MapType.normal : MapType.hybrid,
                  onMapCreated: _onMapCreated,
                  markers: markers(context),
                  initialCameraPosition: positions[indexOfCity],
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: true,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(Icons.search),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              width: screenSize(context).width * 0.65,
                              child: DropdownButton<String>(
                                underline: Container(),
                                value: selectedCountry,
                                isExpanded: true,
                                items: cities.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                onChanged: onChangedCallback,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: mapTypeNormal ? MapType.normal : MapType.hybrid,
                onMapCreated: _onMapCreated,
                // markers: markers(context),
                initialCameraPosition: positions[indexOfCity],
                mapToolbarEnabled: true,
                zoomControlsEnabled: true,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.search),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            width: screenSize(context).width * 0.65,
                            child: DropdownButton<String>(
                              underline: Container(),
                              value: selectedCountry,
                              isExpanded: true,
                              items: cities.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: onChangedCallback,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );

          return Stack(
            children: [
              Image.asset(
                'assets/scr_1.png',
                fit: BoxFit.fill,
                height: screenSize(context).height,
                width: screenSize(context).width,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize(context).height * 0.8,
                  left: screenSize(context).width * 0.45,
                ),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF046cbc)),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              mapTypeNormal = !mapTypeNormal;
            },
          );
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.map),
      ),
    );
  }
}
