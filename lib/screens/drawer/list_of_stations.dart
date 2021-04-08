import 'package:flutter/material.dart';
import 'package:gasapp/screens/show_in_map_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/list_of_stations_bloc/list_of_stations_bloc.dart';
import 'package:gasapp/models/regions_model.dart';
import 'package:gasapp/utils/constants.dart';

class ListOfStations extends StatefulWidget {
  List<RegionsModel> list;
  ListOfStations({this.list});

  @override
  _ListOfStationsState createState() => _ListOfStationsState();
}

class _ListOfStationsState extends State<ListOfStations> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  Widget Status(String isOpen) {
    if (isOpen == "1") {
      return Text(
        'Открыт',
        style: TextStyle(color: Colors.green),
      );
    } else {
      return Text(
        'Закрыт',
        style: TextStyle(color: Colors.red),
      );
    }
  }

  final bool booleanCheckingTheStation = false;

  String selectedCountry;
  int indexOfCity = 0;

  void onChangedCallback(city) async {
    selectedCountry = city;
    for (int i = 0; i < widget.list.length; i++) {
      if (city == widget.list[i].name) {
        setState(() {
          indexOfCity = i;
          BlocProvider.of<ListOfStationsBloc>(_scaffoldState.currentContext)
              .add(ListOfStationsGetEvent(
                  regionId: widget.list[i].id.toString()));
        });
      }
    }
    // mapController = await _controller.future;
    // mapController.animateCamera(
    //   CameraUpdate.newCameraPosition(positions[indexOfCity]),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF016fbe),
            )),
      ),
      body: BlocBuilder<ListOfStationsBloc, ListOfStationsState>(
        builder: (context, state) {
          if (state is ListOfStationsLoadedState) {
            print('loadedloadedloaded');
            print(state.listOfStationsModel.length);
            selectedCountry = widget.list[indexOfCity].name;
            return Container(
              padding: EdgeInsets.only(
                  top: screenSize(context).height * 0.01,
                  left: screenSize(context).width * 0.1,
                  bottom: screenSize(context).height * 0.01,
                  right: screenSize(context).width * 0.1),
              child: Column(
                children: [
                  Container(
                    //padding: EdgeInsets.only(left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1, top: screenSize(context).height * 0.1, bottom: screenSize(context).height * 0.02),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Перечень заправочных станций',
                          style:
                              TextStyle(color: Color(0xFF016fbe), fontSize: 24),
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: screenSize(context).width * 0.7,
                      padding: EdgeInsets.only(left: 10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: DropdownButton<String>(
                        underline: Container(),
                        // dropdownColor: Colors.lightBlue,
                        value: selectedCountry,
                        isExpanded: true,
                        items: widget.list.map((RegionsModel value) {
                          return DropdownMenuItem<String>(
                            value: value.name ?? "text",
                            child: Text(
                              value.name ?? "text",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: onChangedCallback,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * 0.03,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: state.listOfStationsModel.length,
                        itemBuilder: (context, i) {
                          return Container(
                            //height: screenSize(context).height * 0.1,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.listOfStationsModel[i].name ?? "text",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: screenSize(context).height * 0.015,
                                ),

                                // Align(
                                //   alignment: Alignment.centerLeft,
                                //   child: Text(state
                                //               .listOfStationsModel[i].boss !=
                                //           null
                                //       ? "Владелец: ${state.listOfStationsModel[i].boss}"
                                //       : ""),
                                // ),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Местонахождение: ${state.listOfStationsModel[i].comment}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowInMapScreen(
                                                        x: double.parse(state
                                                            .listOfStationsModel[
                                                                i]
                                                            .coordX),
                                                        y: double.parse(
                                                          state
                                                              .listOfStationsModel[
                                                                  i]
                                                              .coordY,
                                                        ))));
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Показать на карте',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color(0xFF016fbe)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              screenSize(context).width * 0.05),
                                      child: Text('Статус: '),
                                    ),
                                    //   onTap: () {
                                    //     Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             ShowInMapScreen(
                                    //           x: double.parse(state
                                    //               .listOfStationsModel[i]
                                    //               .coordX),
                                    //           y: double.parse(
                                    //             state.listOfStationsModel[i]
                                    //                 .coordY,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     );
                                    //   },
                                    //   child: Text(
                                    //     'Показать на карте',
                                    //     style: TextStyle(
                                    //         decoration:
                                    //             TextDecoration.underline,
                                    //         color: Colors.blue),
                                    //   ),
                                    // ),
                                    // Text('Статус: '),
                                    Status(state.listOfStationsModel[i].isOpen),
                                    //Text(falseBooleanCreatedForCheckingTheStation ? 'Открыт' : 'Закрыт')
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          screenSize(context).height * 0.02),
                                  child: Divider(),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (state is ListOfStationsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListOfStationsErrorState) {}
          return Container(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
