import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:gasapp/utils/utils.dart';

class VolumeOfDeliveries extends StatefulWidget {
  @override
  _VolumeOfDeliveriesState createState() => _VolumeOfDeliveriesState();
}

class _VolumeOfDeliveriesState extends State<VolumeOfDeliveries> {
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
                          '28 марта 2021',
                          style: TextStyle(
                            color: Color(0xFFe40000), fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text('Другая дата', style: TextStyle(fontSize: 10, color: Color(0xFF2295C1)),),
                    ),
                    Image.asset(
                      'assets/icon_1.png',
                      width: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ],
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
