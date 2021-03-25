import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

//TODO HTML links

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: screenSize(context).height * 0.1),
            child: Align(alignment: Alignment.centerLeft,child: Text('О приложении', style: TextStyle(color: Color(0xFF2295C1), fontSize: 30),)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenSize(context).width * 0.1, vertical: screenSize(context).height * 0.1),
            child: Column(
              children: [
                Text('Для удобства наших клиентов мы добавили возможность получать информацию о наличии газа на наших АГЗС. Находите ближайшие к вам заправочные станции.'),
                Text('Мобильное приложение АГЗС "ЭКО" позволяет найти ближайшую АГЗС, получить актуальную информацию о ценах на топливо, узнать о текущих объемах и специальных предложениях, связаться с администрацие.'),
                Text('Поделитесь с нами своими идеями и пожеланиями, написав на адрес электронной почты marchelo2014@gmail.com или позвонив на круглосуточную горячую линию (звонок по России бесплатный) 8 800 555 11 63.'),
              ],
            ),
          ),
        ],
      )
    );
  }
}
