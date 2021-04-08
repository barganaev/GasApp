import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/info_bloc/info_bloc.dart';
import 'package:gasapp/blocs/map_bloc/map_bloc.dart';
import 'package:gasapp/blocs/regions_bloc/regions_bloc.dart';
import 'package:gasapp/models/regions_model.dart';
import 'package:gasapp/models/stations_model.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:gasapp/utils/cur_position.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gasapp/utils/utils.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  List<StationsModel> list;
  BitmapDescriptor customIconActive;
  BitmapDescriptor customIconNotActive;

  // HomeScreen(
  //     {@required this.list, this.customIconActive, this.customIconNotActive});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  bool mapTypeNormal = true;

  int indexOfCity = 0;
  String selectedCountry;
  String selectedProvince;

  BitmapDescriptor pinLocationIcon;
  List<RegionsModel> regions;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if (Platform.isAndroid) {
      print('Android is true');
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_green_android.png')
          .then((onValue) {
        widget.customIconActive = onValue;
      });
      BitmapDescriptor.fromAssetImage(ImageConfiguration(),
              'assets/ico_agzs_gray_android.png' /*'assets/ico_agzs_gray_22_32_android.png'*/)
          .then((onValue) {
        widget.customIconNotActive = onValue;
      });
    } else {
      print('IOS is true');
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_green_ios.png')
          .then((onValue) {
        widget.customIconActive = onValue;
      });
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_gray_ios.png')
          .then((onValue) {
        widget.customIconNotActive = onValue;
      });
    }
    super.initState();
  }

  void onChangedCallback(city) async {
    print("HERE YOU ARE");
    print(city);
    selectedCountry = city;
    for (int i = 0; i < regions.length; i++) {
      if (city == regions[i].name) {
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
    try {
      Position position = await determinePosition();
      LatLng latLatPosition = LatLng(position.latitude, position.longitude);

      CameraPosition cameraPosition =
          new CameraPosition(target: latLatPosition, zoom: 13);

      mapController = await _controller.future;
      mapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    } catch (e) {
      print(e);
    }
  }

  void _onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(mapStyle);
    // _controller.complete(controller);
    await curLocation();
  }

  void getBottomSheet(BuildContext context, StationsModel stationsModel) {
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
          height: screenSize(context).height * 0.25,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize(context).height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(stationsModel.name ?? " ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: screenSize(context).height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenSize(context).width * 0.4,
                      child: Text("Адрес:"),
                    ),
                    Container(
                      width: screenSize(context).width * 0.4,
                      child: Text(stationsModel.comment),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Container(
                //       width: screenSize(context).width * 0.4,
                //       child: Text("Рабочее время: "),
                //     ),
                //     Container(
                //       width: screenSize(context).width * 0.4,
                //       child: Text("10:00 - 22:00"),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenSize(context).width * 0.4,
                      child: Text("Статус: "),
                    ),
                    Container(
                        width: screenSize(context).width * 0.4,
                        child: Text(
                            stationsModel.isOpen == "1" ? 'Открыт' : 'Закрыт')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Container(
                //       width: screenSize(context).width * 0.4,
                //       child: Text("Объем запаса"),
                //     ),
                //     Container(
                //       width: screenSize(context).width * 0.4,
                //       child: Text("10 тонна"),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Container(
                //       width: screenSize(context).width * 0.4,
                //       child:
                //           Text("Ориентировочные даты, в котовых газ должен быть"),
                //     ),
                //     Container(
                //       width: screenSize(context).width * 0.4,
                //       child: Text("25.03 - 22.04"),
                //     ),
                //   ],
                // ),
              ],
            ),
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
            getBottomSheet(context, widget.list[i - 1]);
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
    return BlocBuilder<RegionsBloc, RegionsState>(
      builder: (context, state) {
        if (state is RegionsLoadedState) {
          regions = state.regionsModel;
          selectedCountry = state.regionsModel[indexOfCity].name;
          print(selectedCountry);
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            drawer: HomeDrawer(
              list: state.regionsModel ?? [],
            ),
            body: BlocBuilder<MapBloc, MapState>(
              builder: (context, state) {
                if (state is MapLoadedState) {
                  widget.list = state.stationsModel;
                  return Stack(
                    children: [
                      GoogleMap(
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        mapType:
                            mapTypeNormal ? MapType.normal : MapType.hybrid,
                        onMapCreated: _onMapCreated,
                        markers: markers(context),
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
                                  // Scaffold.of(context).openDrawer();
                                  _scaffoldKey.currentState.openDrawer();
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(Icons.search),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    width: screenSize(context).width * 0.65,
                                    child: DropdownButton<String>(
                                      underline: Container(),
                                      value: selectedCountry,
                                      isExpanded: true,
                                      items: regions.map((RegionsModel value) {
                                        return DropdownMenuItem<String>(
                                          value: value.name,
                                          child: Text(
                                            value.name,
                                            style:
                                                TextStyle(color: Colors.black),
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
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
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
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }
}
