import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/self_station_bloc/self_station_bloc.dart';
import 'package:gasapp/screens/show_in_map_screen.dart';
import 'package:gasapp/translations/locale_keys.g.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

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
        LocaleKeys.account_page_open.tr()/*'Открыт'*/,
        style: TextStyle(color: Colors.green),
      );
    } else {
      return Text(
        LocaleKeys.account_page_close.tr()/*'Закрыт'*/,
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
            color: Color(0xFF016fbe),
          ),
        ),
        centerTitle: true,
        title: Text(
          LocaleKeys.account_page_name.tr()/*'Личный кабинет'*/,
          style: TextStyle(color: Color(0xFF016fbe)),
        ),
      ),
      body: BlocBuilder<SelfStationBloc, SelfStationState>(
        builder: (context, state) {
          if (state is SelfStationLoaded) {
            print("in loaded");
            return Column(
              children: [
                Container(
                  height: screenSize(context).height * 0.18,
                  color: Colors.grey[200],
                  child: IntrinsicHeight(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenSize(context).width * 0.05,
                                    right: screenSize(context).width * 0.05),
                                child: CircleAvatar(
                                  radius: 32,
                                  backgroundColor: Colors.grey[300],
                                  child: Image.asset(
                                    'assets/logo_blue.png',
                                    height: screenSize(context).height * 0.08,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize(context).height * 0.05),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenSize(context).width * 0.55,
                                      child: Text(
                                        state.selfStationModel.message !=
                                                    null &&
                                                state.selfStationModel.message
                                                    .isNotEmpty
                                            ? state.selfStationModel.message[0]
                                                    .user_name ??
                                                " "
                                            : " ",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: screenSize(context).width * 0.55,
                                      child: Text(
                                        state.selfStationModel.message !=
                                                    null &&
                                                state.selfStationModel.message
                                                    .isNotEmpty
                                            ? state.selfStationModel.message[0]
                                                    .phone_number ??
                                                " "
                                            : " ",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: screenSize(context).width * 0.55,
                                      child: Text(
                                        state.selfStationModel.message !=
                                                    null &&
                                                state.selfStationModel.message
                                                    .isNotEmpty
                                            ? "Email: ${state.selfStationModel.message[0].email}" ??
                                                " "
                                            : " ",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenSize(context).height * 0.05,
                                right: screenSize(context).width * 0.03),
                            child: IconButton(
                              icon: Icon(Icons.settings),
                              onPressed: () {
                                showDialog(
                                        context: context,
                                        builder: (_) => Container(
                                              margin: EdgeInsets.only(
                                                  top: screenSize(context)
                                                          .height *
                                                      0.25,
                                                  left: screenSize(context)
                                                          .width *
                                                      0.2,
                                                  right: screenSize(context)
                                                          .width *
                                                      0.1,
                                                  bottom: screenSize(context)
                                                          .height *
                                                      0.48),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      child: Center(
                                                          child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            screenSize(context)
                                                                    .width *
                                                                0.05),
                                                    child: Container(
                                                        child: Text(
                                                          LocaleKeys.account_page_alert.tr()/*'Вы действительно хотите закрыть аккаунт и выйти из личного кабинета?'*/,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  ))),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal:
                                                                  screenSize(context)
                                                                          .width *
                                                                      0.05),
                                                          width:
                                                              screenSize(context)
                                                                      .width *
                                                                  0.3,
                                                          child: TextButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all<Color>(Colors
                                                                          .grey),
                                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10)))),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                LocaleKeys.account_page_no.tr()/*'Нет'*/,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ))),
                                                      Expanded(
                                                        child: Container(
                                                            padding: EdgeInsets.only(
                                                                right: screenSize(
                                                                            context)
                                                                        .width *
                                                                    0.05),
                                                            child: TextButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all<
                                                                              Color>(
                                                                          Color(
                                                                              0xFF016fbe)),
                                                                  shape: MaterialStateProperty
                                                                      .all<
                                                                          RoundedRectangleBorder>(
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  final prefs =
                                                                      await SharedPreferences
                                                                          .getInstance();
                                                                  await prefs
                                                                      .clear();
                                                                  Navigator.of(
                                                                          context)
                                                                      .popUntil(
                                                                          (route) =>
                                                                              route.isFirst);
                                                                },
                                                                child: Text(
                                                                  LocaleKeys.account_page_exit.tr()/*'Выйти'*/,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ))),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: screenSize(context)
                                                            .height *
                                                        0.03,
                                                  )
                                                ],
                                              ),
                                            ),
                                        barrierDismissible: false)
                                    .then((value) {
                                  setState(() {});
                                });
                                // AlertDialog(
                                //   title: Text('Вы действительно хотите закрыть аккаунт и выйти из личного кабинета?'),
                                //   actions: [
                                //     ElevatedButton(
                                //       onPressed: (){
                                //         Navigator.pop(context);
                                //       },
                                //       child: Text('Нет'),
                                //     )
                                //   ],
                                // );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: screenSize(context).height * 0.6,
                    padding: EdgeInsets.only(
                      left: screenSize(context).width * 0.1,
                      right: screenSize(context).width * 0.1,
                    ),
                    child: Column(
                      children: [
                        // Text(state.selfStationModel.message != null &&
                        //         state.selfStationModel.message.isNotEmpty
                        //     ? state.selfStationModel.message[0].boss ?? " "
                        //     : " "),
                        // Text('+7(707) 001 01 01'),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenSize(context).height * 0.05),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LocaleKeys.account_page_work_mode.tr()/*'Режим работы газовых заправок'*/,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF016fbe),
                                  fontSize: 17),
                            ),
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
                                            width:
                                                screenSize(context).width * 0.5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.selfStationModel
                                                          .message[i].name ??
                                                      "name",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.orange),
                                                ),
                                                Text(
                                                  state.selfStationModel
                                                          .message[i].comment ??
                                                      "address",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ShowInMapScreen(
                                                                x: double.parse(state
                                                                    .selfStationModel
                                                                    .message[i]
                                                                    .coordX),
                                                                y: double.parse(
                                                                  state
                                                                      .selfStationModel
                                                                      .message[
                                                                          i]
                                                                      .coordY,
                                                                )),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    LocaleKeys.account_page_show_in_map.tr()/*'Показать на карте'*/,
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color:
                                                            Color(0xFF016fbe)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    screenSize(context).width *
                                                        0.03),
                                            child: Column(
                                              children: [
                                                Container(
                                                    child: Text('Сейчас: ')),
                                                Status(state.selfStationModel
                                                    .message[i].isOpen)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize(context).height *
                                                0.02),
                                        child: Container(
                                          //color: Colors.lightGreen[200],
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width: screenSize(context)
                                                          .width *
                                                      0.5, // TODO: Crash is here!
                                                  padding: EdgeInsets.only(
                                                      left: screenSize(context)
                                                              .width *
                                                          0.03),
                                                  child: Text(
                                                    LocaleKeys.account_page_open_or_close.tr()/*'Открыть или закрыть объект'*/,
                                                    style: TextStyle(
                                                        fontSize:
                                                            screenSize(context)
                                                                    .width *
                                                                0.034),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: screenSize(context)
                                                            .width *
                                                        0.03),
                                                child: CupertinoSwitch(
                                                  trackColor: Colors.red,
                                                  activeColor: Colors.green,
                                                  value: state
                                                              .selfStationModel
                                                              .message[i]
                                                              .isOpen ==
                                                          "1"
                                                      ? true
                                                      : false,
                                                  onChanged: (bool value) {
                                                    showDialog(
                                                            context: context,
                                                            builder:
                                                                (_) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          LocaleKeys.account_page_alert_2.tr()/*'Вы уверены?'*/),
                                                                      actions: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {},
                                                                          child:
                                                                              TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text(
                                                                                  LocaleKeys.account_page_no.tr()/*'Нет'*/,
                                                                              style: TextStyle(color: Colors.black),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            final prefs =
                                                                                await SharedPreferences.getInstance();
                                                                            String
                                                                                token =
                                                                                prefs.getString("token");
                                                                            String
                                                                                isOpen;
                                                                            if (state.selfStationModel.message[i].isOpen ==
                                                                                "0") {
                                                                              isOpen = "true";
                                                                            } else {
                                                                              isOpen = "false";
                                                                            }
                                                                            BlocProvider.of<SelfStationBloc>(context).add(
                                                                              SelfStationToggleEvent(
                                                                                token: token,
                                                                                stationId: state.selfStationModel.message[i].id.toString(),
                                                                                isOpen: isOpen,
                                                                                regionId: "1",
                                                                              ),
                                                                            );
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              TextButton(
                                                                            child:
                                                                                Text(
                                                                                  LocaleKeys.account_page_yes.tr()/*'Да'*/,
                                                                              style: TextStyle(color: Colors.black),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                            barrierDismissible:
                                                                false)
                                                        .then((value) {
                                                      setState(() {});
                                                    });
                                                    print(value);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                screenSize(context).height *
                                                    0.02),
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
                  ),
                ),
              ],
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
