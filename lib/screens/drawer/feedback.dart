import 'package:flutter/material.dart';
import 'package:gasapp/utils/constants.dart';

class Feedbackk extends StatefulWidget {
  @override
  _FeedbackkState createState() => _FeedbackkState();
}

class _FeedbackkState extends State<Feedbackk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.1, horizontal: screenSize(context).width * 0.1),
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.only(left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1, top: screenSize(context).height * 0.1, bottom: screenSize(context).height * 0.02),
                child: Align(alignment: Alignment.centerLeft,child: Text('Письмо в техподдержку', style: TextStyle(color: Color(0xFF2295C1), fontSize: 30),)),
              ),
              Container(
                //padding: EdgeInsets.symmetric(horizontal: screenSize(context).width * 0.1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: screenSize(context).height * 0.1),
                    child: Text(
                      'Касательно работы мобильного приложения'
                    ),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize(context).height * 0.02),
                child: Align(alignment: Alignment.centerLeft, child: Text('Ваше имя')),
              ),
              Container(
                height: screenSize(context).height * 0.05,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    )
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize(context).height * 0.02),
                child: Align(alignment: Alignment.centerLeft, child: Text('Электронная почта')),
              ),
              Container(
                height: screenSize(context).height * 0.05,
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    )
                ),
              ),
              Padding(
                padding:EdgeInsets.only(top: screenSize(context).height * 0.02),
                child: Align(alignment: Alignment.centerLeft, child: Text('Текст сообщения')),
              ),
              Container(
                // height: screenSize(context).height * 0.15,
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
