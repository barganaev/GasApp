import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';

import '../login.dart';
import 'about_company.dart';
import 'about_project.dart';
import 'balance_gas.dart';

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
              color: Colors.white,
              child: ListTile(
                contentPadding: EdgeInsets.only(
                  top: 0,
                  left: 10,
                  right: 10,
                  bottom: 0,
                ),
                leading: Image.asset(
                  "assets/account_photo_default.png",
                  width: screenSize(context).width * 0.2,
                  // height: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  "Name Surname",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text("@username"),
                trailing: Icon(Icons.arrow_right_sharp),
              ),
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.blueGrey[900]),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutCompany()),
              );
            },
            title: Text("About company"),
            trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutProject()),
              );
            },
            title: Text("About project"),
            trailing: Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GasBalance()),
              );
            },
            title: Text("Balance"),
            trailing: Icon(Icons.arrow_right_sharp),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: screenSize(context).height * 0.5,
            color: Colors.orangeAccent,
            child: Center(
              child: Text("Ads"),
            ),
          )
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
