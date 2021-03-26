import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<bool> valuesOfButton = [];

  bool switchState = false;

  bool falseBooleanCreatedForCheckingTheStation = false;

  Widget Status(int index) {
    if (/*switchState*/ valuesOfButton[index]) {
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
    return Scaffold(
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
      body: Container(
        padding: EdgeInsets.only(
            /*top: screenSize(context).height * 0.1,*/ left:
                screenSize(context).width * 0.1,
            right: screenSize(context).width * 0.1),
        child: Column(
          children: [
            Text('Иванов Петр Иванович'),
            Text('+7(707) 001 01 01'),
            Padding(
              padding: EdgeInsets.only(top: screenSize(context).height * 0.05),
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
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    valuesOfButton.add(false);
                    return Container(
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
                                    Text(
                                      'АГЗС LPG Trade',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.orange),
                                    ),
                                    Text(
                                      'Местонахождение: город Актау, микрорайон 21, промышленная база',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      'Показать на карте',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: screenSize(context).width * 0.03),
                                child: Column(
                                  children: [
                                    Container(child: Text('Сейчас: ')),
                                    Status(i)
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
                                              screenSize(context).width * 0.03),
                                      child:
                                          Text('Открыть или закрыть объект')),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right:
                                            screenSize(context).width * 0.03),
                                    child: CupertinoSwitch(
                                        trackColor: Colors.red,
                                        activeColor: Colors.green,
                                        value: valuesOfButton[i],
                                        onChanged: (bool value) {
                                          showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      CupertinoAlertDialog(
                                                        title:
                                                            Text('Вы уверены?'),
                                                        actions: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:
                                                                CupertinoDialogAction(
                                                              child: Text('No'),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              valuesOfButton[
                                                                  i] = value;
                                                              falseBooleanCreatedForCheckingTheStation =
                                                                  value;
                                                            },
                                                            child:
                                                                CupertinoDialogAction(
                                                              child:
                                                                  Text('Yes'),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                  barrierDismissible: false)
                                              .then((value) {
                                            setState(() {});
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenSize(context).height * 0.02),
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
    );
  }
}
