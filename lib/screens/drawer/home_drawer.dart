import 'package:flutter/material.dart';
import 'package:gasapp/screens/drawer/about_app.dart';
import 'package:gasapp/screens/drawer/feedback.dart';
import 'package:gasapp/screens/drawer/list_of_stations.dart';
import 'package:gasapp/screens/drawer/report_about_problem.dart';
import 'package:gasapp/utils/constants.dart';
import '../login.dart';


class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogIn(),
                ),
              );
            },
            child: Container(
              height: screenSize(context).height * 0.13,
              //color: Colors.red,
              //color: Colors.white,
              child: ListTile(
                contentPadding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                  bottom: 0,
                ),
                leading: Image.asset(
                  "assets/logo_blue.png",
                  //width: screenSize(context).width * 0.2,
                  // height: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  "АГЗС",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color(0xFF5897cf) /*Colors.black87*/,
                      fontSize: 20),
                ),
                subtitle: Text(
                  "Газозаправочные станции Мангистауской области",
                  style: TextStyle(color: Color(0xFF5897cf), fontSize: 12),
                ),
                //trailing: Icon(Icons.arrow_right_sharp),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutApp()),
              );
            },
            leading: Image.asset(
              'assets/icon_2.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text("Карта заправочных станций"),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutApp()),
              );
            },
            leading: Image.asset(
              'assets/icon_1.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text("Объемы поставок газа"),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListOfStations()),
              );
            },
            leading: Image.asset(
              'assets/icon_3.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text("Перечень станций"),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogIn()));
            },
            leading: Image.asset(
              'assets/icon_4.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text("Вход в личный кабинет"),
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
                MaterialPageRoute(builder: (context) => ReportAboutProblem()),
              );
            },
            leading: Image.asset(
              'assets/icon_5.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text("Сообщить о проблеме"),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Feedbackk()),);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Feedback()),
              // );
            },
            leading: Image.asset(
              'assets/icon_6.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text("Обратнаяя связь"),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutApp()),
              );
            },
            leading: Image.asset(
              'assets/icon_7.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            title: Text("О приложении"),
            //trailing: Icon(Icons.arrow_right_sharp),
          ),

          // SizedBox(
          //   height: 40,
          // ),
          // Container(
          //   height: screenSize(context).height * 0.5,
          //   color: Colors.orangeAccent,
          //   child: Center(
          //     child: Text("Ads"),
          //   ),
          // )

          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   color: Colors.white,
          //   child: Column(
          //     children: <Widget>[
          //       // List items goes here...
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
