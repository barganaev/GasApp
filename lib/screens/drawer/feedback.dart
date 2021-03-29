import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/add_feedback_bloc/add_feedback_bloc.dart';
import 'package:gasapp/utils/constants.dart';

class Feedbackk extends StatefulWidget {
  @override
  _FeedbackkState createState() => _FeedbackkState();
}

class _FeedbackkState extends State<Feedbackk> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
      ),
      body: BlocConsumer<AddFeedbackBloc, AddFeedbackState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AddFeedbackInitial) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: screenSize(context).width * 0.1,
                  right: screenSize(context).width * 0.1,
                  bottom: screenSize(context).height * 0.1,
                ),
                child: Column(
                  children: [
                    Container(
                      //padding: EdgeInsets.only(left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1, top: screenSize(context).height * 0.1, bottom: screenSize(context).height * 0.02),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Письмо в техподдержку',
                            style: TextStyle(
                                color: Color(0xFF2295C1), fontSize: 30),
                          )),
                    ),
                    Container(
                        //padding: EdgeInsets.symmetric(horizontal: screenSize(context).width * 0.1),
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: screenSize(context).height * 0.1),
                        child: Text('Касательно работы мобильного приложения'),
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSize(context).height * 0.02),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Ваше имя'),
                      ),
                    ),
                    Container(
                      height: screenSize(context).height * 0.05,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSize(context).height * 0.02),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Электронная почта'),
                      ),
                    ),
                    Container(
                      height: screenSize(context).height * 0.05,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSize(context).height * 0.02),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Текст сообщения')),
                    ),
                    Container(
                      child: TextFormField(
                        maxLines: 5,
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSize(context).height * 0.03),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF2295C1),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Отправить'),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Text('1');
          }
        },
      ),
    );
  }
}
