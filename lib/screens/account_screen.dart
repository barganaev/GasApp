import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasapp/screens/home_screen.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(Icons.arrow_back_outlined),
        // ),
        centerTitle: true,
        title: Text('АЗС КазМунайГаз'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          // Padding(
          //   padding: EdgeInsets.only(right: 20),
          //   child: GestureDetector(
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => HomeScreen()));
          //       },
          //       child: Icon(Icons.location_city)),
          // )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Название: ')),
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text(
                        'АЗС 3 КазМунаaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaйГаз КазМунайГаз №3'))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Название: ')),
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child:
                        Text('АЗС 3 КазМунaasайГаз asd asd  КазМунasdайГаз №3'))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Название: ')),
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('АЗС 3 КазМунайГаз КазМунайГаз №3'))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Название: ')),
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('АЗС 3 КазМунайГаз КазМунайГаз №3'))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      'Открыть заправку',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: CupertinoSwitch(
                      value: switchState,
                      onChanged: (bool value) {
                        setState(() {
                          switchState = value;
                        });
                        print(value);
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
