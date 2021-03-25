import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:gasapp/utils/utils.dart';

class ListOfStations extends StatefulWidget {
  @override
  _ListOfStationsState createState() => _ListOfStationsState();
}

class _ListOfStationsState extends State<ListOfStations> {

  Widget Status(){
    if(falseBooleanCreatedForCheckingTheStation){
      return Text('Открыт', style: TextStyle(color: Colors.green),);
    }else{
      return Text('Закрыт', style: TextStyle(color: Colors.red),);
    }
  }

  final bool falseBooleanCreatedForCheckingTheStation = false;

  String selectedCountry = 'Ақтау қаласы';
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
    // mapController = await _controller.future;
    // mapController.animateCamera(
    //   CameraUpdate.newCameraPosition(positions[indexOfCity]),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screenSize(context).height * 0.1, left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1),
        child: Column(
          children: [
            Container(
              //padding: EdgeInsets.only(left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1, top: screenSize(context).height * 0.1, bottom: screenSize(context).height * 0.02),
              child: Align(alignment: Alignment.centerLeft,child: Text('Перечень заправочных станций', style: TextStyle(color: Color(0xFF2295C1), fontSize: 30),)),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey
                )
              ),
              child: DropdownButton<String>(
                underline: Container(),
                // dropdownColor: Colors.lightBlue,
                value: selectedCountry,
                isExpanded: true,
                items: cities.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child:
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Icon(Icons.keyboard_arrow_down),
                    //     SizedBox(width: 10,),
                    //     Text(value, style: TextStyle(color: Colors.black),)
                    //   ],
                    // )
                    Flexible(
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: onChangedCallback,
              ),
            ),
            SizedBox(height: screenSize(context).height * 0.05,),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i){
                    return Container(
                      //height: screenSize(context).height * 0.1,
                      child: Column(
                        children: [
                          Align(alignment: Alignment.centerLeft, child: Text('Заправочная станция LPG Trade', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                          Align(alignment: Alignment.centerLeft, child: Text('Владелец: TOO LPG Trade')),
                          Text('Местонахождение: город Актау, микрорайон 21, промышленная база', style: TextStyle(fontSize: 15),),
                          Row(
                            children: [
                              Text('Показать на карте', style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),),
                              SizedBox(width: screenSize(context).width * 0.05,),
                              Text('Статус: '),
                              Status(),
                              //Text(falseBooleanCreatedForCheckingTheStation ? 'Открыт' : 'Закрыт')
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.02),
                            child: Divider(),
                          )
                        ],
                      ),
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
