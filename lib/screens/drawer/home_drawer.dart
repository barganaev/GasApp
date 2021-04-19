import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/add_feedback_bloc/add_feedback_bloc.dart';
import 'package:gasapp/blocs/info_bloc/info_bloc.dart';
import 'package:gasapp/blocs/list_of_stations_bloc/list_of_stations_bloc.dart';
import 'package:gasapp/blocs/self_station_bloc/self_station_bloc.dart';
import 'package:gasapp/blocs/shipment_bloc/shipment_bloc.dart';
import 'package:gasapp/models/regions_model.dart';
import 'package:gasapp/screens/drawer/about_app.dart';
import 'package:gasapp/screens/drawer/feedback.dart';
import 'package:gasapp/screens/drawer/list_of_stations.dart';
import 'package:gasapp/screens/drawer/report_about_problem.dart';
import 'package:gasapp/screens/drawer/volume_of_deliveries.dart';
import 'package:gasapp/translations/locale_keys.g.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../account_screen.dart';
import '../login.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeDrawer extends StatefulWidget {
  List<RegionsModel> list;

  HomeDrawer({this.list});
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    print("_HomeDrawerState");
    print(context.locale.toString());
    log(context.locale.toString());
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: screenSize(context).height * 0.13,
            child: ListTile(
              contentPadding: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                bottom: 0,
              ),
              leading: Image.asset(
                "assets/logo_blue.png",
                fit: BoxFit.fill,
              ),
              subtitle: Text(
                LocaleKeys.title.tr()/*"Газозаправочные станции Мангистауской области"*/,
                style: TextStyle(color: Color(0xFF016fbe), fontSize: 15 /*12*/),
              ),
            ),
          ),
          Divider(
            height: 10,
            thickness: 1,
            color: Colors.grey /*Colors.blueGrey[900]*/,
            indent: MediaQuery.of(context).size.width * 0.05,
            endIndent: MediaQuery.of(context).size.width * 0.05,
          ),
          ListTile(
            onTap: () {
              // BlocProvider.of<MapBloc>(context).add(MapGetMarkersEvent());
              Navigator.pop(context);
            },
            leading: Image.asset(
              'assets/icon_2.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text(LocaleKeys.map_of_station.tr()/*"Карта заправочных станций"*/), //Обновить состояние карты
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              final DateTime now = DateTime.now();
              final DateFormat formatter = DateFormat('yyyy-MM-dd');
              final String formatted = formatter.format(now);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<ShipmentBloc>(
                    create: (context) => ShipmentBloc()
                      ..add(
                        ShipmentGetEvent(
                          date: formatted,
                          regionId: "1",
                        ),
                      ),
                    child: VolumeOfDeliveries(
                      list: widget.list,
                    ),
                  ),
                ),
              );
            },
            leading: Image.asset(
              'assets/icon_1.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text(LocaleKeys.volume_of_deliveries_name.tr()/*"Объемы поставок газа"*/),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<ListOfStationsBloc>(
                    create: (context) => ListOfStationsBloc()
                      ..add(ListOfStationsGetEvent(regionId: "1")),
                    lazy: false,
                    child: ListOfStations(list: widget.list),
                  ),
                ),
              );
            },
            leading: Image.asset(
              'assets/icon_3.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text(LocaleKeys.list_of_stations_name.tr()/*"Перечень станций"*/),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();

              if (prefs.containsKey("token")) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SelfStationBloc()
                        ..add(
                          SelfStationGetEvent(
                            token: prefs.getString("token"),
                            regionId: "1",
                          ),
                        ),
                      child: AccountScreen(
                        token: prefs.getString("token"),
                      ),
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              }
            },
            leading: Image.asset(
              'assets/icon_4.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text(LocaleKeys.account_page_name.tr()/*"Личный кабинет"*/),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          Divider(
            height: 10,
            thickness: 1,
            color: Colors.grey /*Colors.blueGrey[900]*/,
            indent: MediaQuery.of(context).size.width * 0.05,
            endIndent: MediaQuery.of(context).size.width * 0.05,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<AddFeedbackBloc>(
                    create: (context) => AddFeedbackBloc(),
                    child: ReportAboutProblem(),
                  ),
                ),
              );
            },
            leading: Image.asset(
              'assets/icon_5.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text(LocaleKeys.report_about_problem_name.tr()/*"Сообщить о проблеме"*/),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<AddFeedbackBloc>(
                    create: (context) => AddFeedbackBloc(),
                    child: Feedbackk(),
                  ),
                ),
              );
            },
            leading: Image.asset(
              'assets/icon_6.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text(LocaleKeys.feedback_name.tr()/*"Обратная связь"*/),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (newcontext) => BlocProvider<InfoBloc>.value(
                    value: BlocProvider.of<InfoBloc>(context),
                    child: AboutApp(),
                  ),
                ),
              );
            },
            leading: Image.asset(
              'assets/icon_7.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text(LocaleKeys.settings_name.tr()/*'Настройки'*/),
            // title: Text(LocaleKeys.about.tr()), //Text("about").tr(),  ??
          ),
          // ListTile(
          //   onTap: () async {
          //     if (context.locale == Locale('ru')) {
          //       await context.setLocale(Locale('kk', 'KZ'));
          //     } else {
          //       await context.setLocale(Locale('ru'));
          //     }
          //   },
          //   leading: Image.asset(context.locale == Locale('ru') ? 'assets/flag_kz.png' : 'assets/flag_ru.png', height: screenSize(context).height * 0.05,),
          //   contentPadding:
          //       EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2),
          //   title: Text(context.locale == Locale('ru')
          //       ? "Қазақ тілі"
          //       : "Русский язык"), //Text("about").tr(),  ??
          // ),
        ],
      ),
    );
  }
}
