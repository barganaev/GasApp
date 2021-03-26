// ACCOUNT SCREEN (CARD VARIANT)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';

class AccountScreenCardVersion extends StatefulWidget {
  @override
  _AccountScreenCardVersionState createState() => _AccountScreenCardVersionState();
}

class _AccountScreenCardVersionState extends State<AccountScreenCardVersion> {

  List<int> isOpen = [0, 1, 0, 1];

  bool switchState = false;

  bool falseBooleanCreatedForCheckingTheStation = false;

  Widget Status(){
    // for (int i = 0; i < isOpen.length; i++) {
    //   if(isOpen[i] == 1){
    //     return Text('Открыт', style: TextStyle(color: Colors.green),);
    //   }else{
    //     return Text('Закрыт', style: TextStyle(color: Colors.red),);
    //   }
    // }
    if(falseBooleanCreatedForCheckingTheStation){
      return Text('Открыт', style: TextStyle(color: Colors.green),);
    }else{
      return Text('Закрыт', style: TextStyle(color: Colors.red),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined, color: Colors.blue,),
        ),
        centerTitle: true,
        title: Text('Личный кабинет', style: TextStyle(color: Colors.blue),),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city, color: Colors.blue),
            onPressed: () {
              Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(/*top: screenSize(context).height * 0.1,*/ left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1),
        child: Column(
          children: [
            Text('Иванов Петр Иванович'),
            Text('+7(707) 001 01 01'),
            Padding(
              padding: EdgeInsets.only(top: screenSize(context).height * 0.05),
              child: Text('Режим работы ваших станции', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: screenSize(context).height * 0.05,),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: isOpen.length,
                    itemBuilder: (context, i){
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.03, horizontal: screenSize(context).width * 0.05),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10),
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: Colors.grey,
                          //       spreadRadius: 5,
                          //       blurRadius: 7,
                          //       offset: Offset(0,3)
                          //     )
                          //   ]
                          // ),
                          //color: Colors.red,
                          //height: screenSize(context).height * 0.1,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //color: Colors.green,
                                    width: screenSize(context).width * 0.5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('АГЗС LPG Trade', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange),),
                                        Text('Местонахождение: город Актау, микрорайон 21, промышленная база', style: TextStyle(fontSize: 15),),
                                        Text('Показать на карте', style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),),
                                        // Container(
                                        //   color: Colors.lightGreen[200],
                                        //   child: Row(
                                        //     children: [
                                        //       Text('Открыть или закрыть объект'),
                                        //       CupertinoSwitch(
                                        //         value: switchState,
                                        //         onChanged: (bool value) {
                                        //           setState(() {
                                        //             switchState = value;
                                        //           });
                                        //           print(value);
                                        //         }),
                                        //
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),

                                  //Padding(
                                  //padding: EdgeInsets.only(right: screenSize(context).width * 0.03),
                                  /*child:*/ Column(
                                    children: [
                                      Container(
                                        // width: 200,
                                        //color: Colors.blue,
                                          child: Text('Сейчас: ')
                                      ),
                                      Status()
                                    ],
                                  ),
                                  //),

                                  // Expanded(
                                  //   child: Container(
                                  //     // width: 200,
                                  //     //color: Colors.blue,
                                  //     child: Text('Сейчас: ')
                                  //   ),
                                  // ),
                                  // Status()
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: screenSize(context).height * 0.02),
                                child: Container(
                                  //color: Colors.lightGreen[200],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: screenSize(context).width * 0.03),
                                          //width: screenSize(context).width * 0.6,
                                          child: Text(
                                              'Открыть или закрыть объект'
                                          )
                                      ),
                                      /*Padding(
                                        padding: EdgeInsets.only(right: screenSize(context).width * 0.03),
                                        child:*/ CupertinoSwitch(
                                          trackColor: Colors.red,
                                          activeColor: Colors.green,
                                          value: switchState,
                                          onChanged: (bool value) {
                                            showDialog(
                                                context: context,
                                                builder: (_) => CupertinoAlertDialog(
                                                  title: Text('Вы уверены?'),
                                                  actions: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        Navigator.pop(context);
                                                        // switchState = false;
                                                        // falseBooleanCreatedForCheckingTheStation = false;
                                                      },
                                                      child: CupertinoDialogAction(
                                                        child: Text('No'),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        Navigator.pop(context);
                                                        switchState = value;
                                                        falseBooleanCreatedForCheckingTheStation = value;
                                                      },
                                                      child: CupertinoDialogAction(
                                                        child: Text('Yes'),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                barrierDismissible: false
                                            ).then((value) {
                                              setState(() {});
                                            });
                                            //switchState = value;
                                            //falseBooleanCreatedForCheckingTheStation = value;
                                            print(value);
                                          }
                                      ),
                                      //),

                                    ],
                                  ),
                                ),
                              ),
                              //Container(),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.02),
                              //   child: Divider(),
                              // )
                            ],
                          ),
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















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gasapp/screens/home_screen.dart';
//
// class AccountScreen extends StatefulWidget {
//   @override
//   _AccountScreenState createState() => _AccountScreenState();
// }
//
// class _AccountScreenState extends State<AccountScreen> {
//   bool switchState = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: GestureDetector(
//         //   onTap: () {
//         //     Navigator.pop(context);
//         //   },
//         //   child: Icon(Icons.arrow_back_outlined),
//         // ),
//         centerTitle: true,
//         title: Text('АЗС КазМунайГаз'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.location_city, color: Colors.white),
//             onPressed: () {
//               Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
//               // Navigator.push(context,
//               //     MaterialPageRoute(builder: (context) => HomeScreen()));
//             },
//           ),
//           // Padding(
//           //   padding: EdgeInsets.only(right: 20),
//           //   child: GestureDetector(
//           //       onTap: () {
//           //         Navigator.push(context,
//           //             MaterialPageRoute(builder: (context) => HomeScreen()));
//           //       },
//           //       child: Icon(Icons.location_city)),
//           // )
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * 0.05),
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             Row(
//               children: [
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.45,
//                     child: Text('Название: ')),
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.45,
//                     child: Text(
//                         'АЗС 3 КазМунаaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaйГаз КазМунайГаз №3'))
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: MediaQuery.of(context).size.height * 0.03),
//               child: Divider(
//                 color: Colors.black,
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.45,
//                     child: Text('Название: ')),
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.45,
//                     child:
//                         Text('АЗС 3 КазМунaasайГаз asd asd  КазМунasdайГаз №3'))
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: MediaQuery.of(context).size.height * 0.03),
//               child: Divider(
//                 color: Colors.black,
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.45,
//                     child: Text('Название: ')),
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.45,
//                     child: Text('АЗС 3 КазМунайГаз КазМунайГаз №3'))
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: MediaQuery.of(context).size.height * 0.03),
//               child: Divider(
//                 color: Colors.black,
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.45,
//                     child: Text('Название: ')),
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.45,
//                     child: Text('АЗС 3 КазМунайГаз КазМунайГаз №3'))
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: MediaQuery.of(context).size.height * 0.03),
//               child: Divider(
//                 color: Colors.black,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.14),
//               child: Divider(
//                 color: Colors.black,
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.7,
//                     child: Text(
//                       'Открыть заправку',
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   child: CupertinoSwitch(
//                       value: switchState,
//                       onChanged: (bool value) {
//                         setState(() {
//                           switchState = value;
//                         });
//                         print(value);
//                       }),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
