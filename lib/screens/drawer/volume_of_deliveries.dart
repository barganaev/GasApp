import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:gasapp/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class VolumeOfDeliveries extends StatefulWidget {
  @override
  _VolumeOfDeliveriesState createState() => _VolumeOfDeliveriesState();
}

class _VolumeOfDeliveriesState extends State<VolumeOfDeliveries> {

  List<String> months = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"];

  String selectedMonthName(int selectedMonth) {
    for (int i = 1; i <= 12; i++) {
      if(selectedMonth == 1) {
        return months[0];
      } else if(selectedMonth == 2) {
        return months[1];
      } else if(selectedMonth == 3) {
        return months[2];
      } else if(selectedMonth == 4) {
        return months[3];
      } else if(selectedMonth == 5) {
        return months[4];
      } else if(selectedMonth == 6) {
        return months[5];
      } else if(selectedMonth == 7) {
        return months[6];
      } else if(selectedMonth == 8) {
        return months[7];
      } else if(selectedMonth == 9) {
        return months[8];
      } else if(selectedMonth == 10) {
        return months[9];
      } else if(selectedMonth == 11) {
        return months[10];
      } else if(selectedMonth == 12) {
        return months[11];
      }
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101)
    );

    if(picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  String selectedCountry = 'город Актау';
  int indexOfCity = 0;

  void onChangedCallback(city) async {
    selectedCountry = city;
    for (int i = 0; i < cities.length; i++) {
      if (city == cities[i]) {
        setState(() {
          indexOfCity = i;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Colors.blue,
            )),
      ),
      body: Container(
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
                    'Объемы поставок',
                    style: TextStyle(color: Color(0xFF2295C1), fontSize: 28),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.01),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${selectedDate.day} ${selectedMonthName(selectedDate.month)}',
                          style: TextStyle(
                            color: Color(0xFFe40000), fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    _selectedDate(context);
                  },
                  child: Row(
                    children: [
                      Container(
                        child: Text('Другая дата', style: TextStyle(fontSize: 10, color: Color(0xFF2295C1)),),
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
            ),
            SizedBox(
              height: screenSize(context).height * 0.03,
            ),
            Container(
              child: IntrinsicHeight(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenSize(context).width * 0.6,
                      color: Color(0xFFeaeaea),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenSize(context).width * 0.03, vertical: screenSize(context).height * 0.03),
                        child: Container(child: Text('Наименование получателя', style: TextStyle(fontSize: 15, color: Color(0xFF6e6e6e)),)),
                      ),
                    ),
                    Row(
                      children: [
                        Container(child: VerticalDivider(thickness: 1, width: 3, color: Colors.white)),
                        Container(
                          width: screenSize(context).width * 0.19,
                          color: Color(0xFFeaeaea),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenSize(context).width * 0.03, vertical: screenSize(context).height * 0.03),
                            child: Container(
                              child: Text(
                                'тонна',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF6e6e6e)
                                ),
                              )
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
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                        ),
                        //height: screenSize(context).height * 0.1,
                        child: IntrinsicHeight(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenSize(context).width * 0.6,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: screenSize(context).width * 0.03, vertical: screenSize(context).height * 0.03),
                                  child: Text('TOO LPG Trade', style: TextStyle(fontSize: 18),),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(child: VerticalDivider(thickness: 1, width: 1, color: Colors.black)),
                                  Container(
                                    width: screenSize(context).width * 0.19,
                                    child: Align( alignment: Alignment.center, child: Text('7.5', style: TextStyle(fontSize: 18),))),
                                ],
                              )
                            ],
                          ),
                        )
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
