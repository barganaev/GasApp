import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/shipment_bloc/shipment_bloc.dart';
import 'package:gasapp/models/regions_model.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:gasapp/utils/utils.dart';
import 'package:intl/intl.dart';

class VolumeOfDeliveries extends StatefulWidget {
  List<RegionsModel> list;
  VolumeOfDeliveries({this.list});

  @override
  _VolumeOfDeliveriesState createState() => _VolumeOfDeliveriesState();
}

// DateTime selectedDate = DateTime.now();

class _VolumeOfDeliveriesState extends State<VolumeOfDeliveries> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  List<String> months = [
    "Январь",
    "Февраль",
    "Март",
    "Апрель",
    "Май",
    "Июнь",
    "Июль",
    "Август",
    "Сентябрь",
    "Октябрь",
    "Ноябрь",
    "Декабрь"
  ];

  String selectedMonthName(int selectedMonth) {
    for (int i = 1; i <= 12; i++) {
      if (selectedMonth == 1) {
        return months[0];
      } else if (selectedMonth == 2) {
        return months[1];
      } else if (selectedMonth == 3) {
        return months[2];
      } else if (selectedMonth == 4) {
        return months[3];
      } else if (selectedMonth == 5) {
        return months[4];
      } else if (selectedMonth == 6) {
        return months[5];
      } else if (selectedMonth == 7) {
        return months[6];
      } else if (selectedMonth == 8) {
        return months[7];
      } else if (selectedMonth == 9) {
        return months[8];
      } else if (selectedMonth == 10) {
        return months[9];
      } else if (selectedMonth == 11) {
        return months[10];
      } else if (selectedMonth == 12) {
        return months[11];
      }
    }
  }

  DateTime selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectedDate(BuildContext context) async {
    print('Show-дамыз');
    print(DateTime.now());
    final DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year),
        lastDate:  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        final String formatted = formatter.format(selectedDate);
        BlocProvider.of<ShipmentBloc>(_scaffoldState.currentContext).add(
          ShipmentGetEvent(
            date: formatted,
            regionId: curRegion,
          ),
        );
      });
  }

  String selectedCountry;
  int indexOfCity = 0;
  String curRegion = "1";
  String formattedDate;

  void onChangedCallback(city) async {
    selectedCountry = city;
    for (int i = 0; i < cities.length; i++) {
      if (city == cities[i]) {
        setState(() {
          indexOfCity = i;
          curRegion = widget.list[i].id.toString();
          final String formatted = formatter.format(selectedDate);
          formattedDate = formatted;
          BlocProvider.of<ShipmentBloc>(_scaffoldState.currentContext).add(
            ShipmentGetEvent(
              date: formatted,
              regionId: curRegion,
            ),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(selectedDate.day);
    print('selectedDate.day');
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
          ),
        ),
      ),
      body: BlocBuilder<ShipmentBloc, ShipmentState>(
        builder: (context, state) {
          if (state is ShipmentLoaded) {
            selectedCountry = widget.list[indexOfCity].name;
            return Container(
              padding: EdgeInsets.only(
                top: screenSize(context).height * 0.01,
                left: screenSize(context).width * 0.1,
                bottom: screenSize(context).height * 0.01,
                right: screenSize(context).width * 0.1,
              ),
              child: Column(
                children: [
                  Container(
                    //padding: EdgeInsets.only(left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1, top: screenSize(context).height * 0.1, bottom: screenSize(context).height * 0.02),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Объемы поставок',
                        style:
                            TextStyle(color: Color(0xFF016fbe), fontSize: 24),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenSize(context).height * 0.01),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${selectedDate.day} ${selectedMonthName(selectedDate.month)}',
                                style: TextStyle(
                                  color: Color(0xFFe40000),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectedDate(context);
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Другая дата',
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF016fbe)),
                              ),
                            ),
                            Image.asset(
                              'assets/icon_1.png',
                              width: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: screenSize(context).height * 0.05,
                      width: screenSize(context).width * 0.6,
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
                            value: value.name,
                            child: Text(
                              value.name ?? "name",
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
                  Container(
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            width: screenSize(context).width * 0.6,
                            color: Color(0xFFeaeaea),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenSize(context).width * 0.03,
                                  vertical: screenSize(context).height * 0.03),
                              child: Container(
                                  child: Text(
                                'Наименование получателя',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF6e6e6e)),
                              )),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: VerticalDivider(
                                  thickness: 1,
                                  width: 3,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: screenSize(context).width * 0.19,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          screenSize(context).width * 0.03,
                                      vertical:
                                          screenSize(context).height * 0.03),
                                  child: Container(
                                    child: Text(
                                      'тонна',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF6e6e6e)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * 0.01,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: state.shipmentModel.message.length,
                        itemBuilder: (context, i) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            //height: screenSize(context).height * 0.1,
                            child: IntrinsicHeight(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenSize(context).width * 0.6,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            screenSize(context).width * 0.03,
                                        vertical:
                                            screenSize(context).height * 0.03,
                                      ),
                                      child: Text(
                                        state.shipmentModel.message[i].name ??
                                            "name",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        width: screenSize(context).width * 0.19,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            state.shipmentModel.message[i]
                                                    .tonna ??
                                                "tonna",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ShipmentLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: Center(
                child: Text('Error'),
              ),
            );
          }
        },
      ),
    );
  }
}
