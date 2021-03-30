import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/self_station_bloc/self_station_bloc.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  String token;
  AccountScreen({this.token});
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<bool> valuesOfButton = [];

  bool switchState = false;

  bool falseBooleanCreatedForCheckingTheStation = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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

  @override
  Widget build(BuildContext context) {
    print('token');
    print(widget.token);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Личный кабинет',
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            tooltip: "Выйти из аккаунта",
          ),
        ],
      ),
      body: BlocBuilder<SelfStationBloc, SelfStationState>(
        builder: (context, state) {
          if (state is SelfStationLoaded) {
            print("in loaded");
            return Container(
              padding: EdgeInsets.only(
                left: screenSize(context).width * 0.1,
                right: screenSize(context).width * 0.1,
              ),
              child: Column(
                children: [
                  Text(state.selfStationModel.message != null &&
                          state.selfStationModel.message.isNotEmpty
                      ? state.selfStationModel.message[0].boss ?? " "
                      : " "),
                  // Text('+7(707) 001 01 01'),
                  Padding(
                    padding:
                        EdgeInsets.only(top: screenSize(context).height * 0.05),
                    child: Text(
                      'Режим работы ваших станции',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * 0.05,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: state.selfStationModel.message.length,
                        itemBuilder: (context, i) {
                          valuesOfButton.add(false);
                          return Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //color: Colors.green,
                                      width: screenSize(context).width * 0.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.selfStationModel.message[i]
                                                    .name ??
                                                "name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.orange),
                                          ),
                                          Text(
                                            state.selfStationModel.message[i]
                                                    .comment ??
                                                "address",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            'Показать на карте',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right:
                                              screenSize(context).width * 0.03),
                                      child: Column(
                                        children: [
                                          Container(child: Text('Сейчас: ')),
                                          Status(state.selfStationModel
                                              .message[i].isOpen)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screenSize(context).height * 0.02),
                                  child: Container(
                                    //color: Colors.lightGreen[200],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(
                                                left:
                                                    screenSize(context).width *
                                                        0.03),
                                            child: Text(
                                                'Открыть или закрыть объект')),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: screenSize(context).width *
                                                  0.03),
                                          child: CupertinoSwitch(
                                              trackColor: Colors.red,
                                              activeColor: Colors.green,
                                              value: state.selfStationModel
                                                          .message[i].isOpen ==
                                                      "1"
                                                  ? true
                                                  : false,
                                              onChanged: (bool value) {
                                                showDialog(
                                                        context: context,
                                                        builder: (_) =>
                                                            CupertinoAlertDialog(
                                                              title: Text(
                                                                  'Вы уверены?'),
                                                              actions: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      CupertinoDialogAction(
                                                                    child: Text(
                                                                        'No'),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    final prefs =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    String
                                                                        token =
                                                                        prefs.getString(
                                                                            "token");
                                                                    String
                                                                        isOpen;
                                                                    if (state
                                                                            .selfStationModel
                                                                            .message[i]
                                                                            .isOpen ==
                                                                        "0") {
                                                                      isOpen =
                                                                          "true";
                                                                    } else {
                                                                      isOpen =
                                                                          "false";
                                                                    }
                                                                    // BlocProvider
                                                                    //     .value(
                                                                    //   value: BlocProvider.of<
                                                                    //           SelfStationBloc>(
                                                                    //       context)
                                                                    //     ..add(
                                                                    //       SelfStationToggleEvent(
                                                                    //         token:
                                                                    //             token,
                                                                    //         stationId:
                                                                    //             state.selfStationModel.message[i].id.toString(),
                                                                    //         isOpen:
                                                                    //             isOpen,
                                                                    //         regionId:
                                                                    //             "1",
                                                                    //       ),
                                                                    //     ),
                                                                    // );
                                                                    // bloc.add(
                                                                    //   SelfStationToggleEvent(
                                                                    //     token:
                                                                    //         token,
                                                                    //     stationId: state
                                                                    //         .selfStationModel
                                                                    //         .message[i]
                                                                    //         .id
                                                                    //         .toString(),
                                                                    //     isOpen:
                                                                    //         isOpen,
                                                                    //     regionId:
                                                                    //         "1",
                                                                    //   ),
                                                                    // );
                                                                    BlocProvider.of<SelfStationBloc>(
                                                                            context)
                                                                        .add(
                                                                      SelfStationToggleEvent(
                                                                        token:
                                                                            token,
                                                                        stationId: state
                                                                            .selfStationModel
                                                                            .message[i]
                                                                            .id
                                                                            .toString(),
                                                                        isOpen:
                                                                            isOpen,
                                                                        regionId:
                                                                            "1",
                                                                      ),
                                                                    );
                                                                    Navigator.pop(
                                                                        context);
                                                                    // valuesOfButton[
                                                                    //         i] =
                                                                    //     value;
                                                                    // falseBooleanCreatedForCheckingTheStation =
                                                                    //     value;
                                                                  },
                                                                  child:
                                                                      CupertinoDialogAction(
                                                                    child: Text(
                                                                        'Yes'),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                        barrierDismissible:
                                                            false)
                                                    .then((value) {
                                                  setState(() {});
                                                });
                                                print(value);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          screenSize(context).height * 0.02),
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SelfStationLoading) {
            print("in loading");
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print("in erorr");
            return Center(
              child: Text("error"),
            );
          }
        },
      ),
    );
  }
}
