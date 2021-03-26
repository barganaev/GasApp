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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1, top: screenSize(context).height * 0.1),
              child: Align(alignment: Alignment.centerLeft,child: Text('О приложении', style: TextStyle(color: Color(0xFF2295C1), fontSize: 30),)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenSize(context).width * 0.08, vertical: screenSize(context).height * 0.07),
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: 'Для удобства наших клиентов мы добавили возможность получать информацию о наличии газа на наших АГЗС.', style: TextStyle(color: Colors.black, fontSize: 15)),
                          TextSpan(text: 'Находите ближайшие к вам заправочные станции.', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15))
                        ]
                      )
                  ),
                  // Text('Для удобства наших клиентов мы добавили возможность получать информацию о наличии газа на наших АГЗС. Находите ближайшие к вам заправочные станции.', style: TextStyle(fontSize: 15),),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.03),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'Мобильное приложение АГЗС "ЭКО" позволяет ', style: TextStyle(color: Colors.black, fontSize: 15)),
                            TextSpan(text: 'найти ближайшую АГЗС', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
                            TextSpan(text: ', получить актуальную информацию о ценах на топливо, узнать о текущих объемах и специальных предложениях, связаться с администрацие.', style: TextStyle(color: Colors.black, fontSize: 15))
                          ]
                        ),
                      )
                      // Text(
                      //   'Мобильное приложение АГЗС "ЭКО" позволяет найти ближайшую АГЗС, получить актуальную информацию о ценах на топливо, узнать о текущих объемах и специальных предложениях, связаться с администрацие.',
                      //   style: TextStyle(fontSize: 15),
                      // )
                  ),
                  Text('Поделитесь с нами своими идеями и пожеланиями, написав на адрес электронной почты marchelo2014@gmail.com или позвонив на круглосуточную горячую линию (звонок по России бесплатный) 8 800 555 11 63.', style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
