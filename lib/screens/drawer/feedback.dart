import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/add_feedback_bloc/add_feedback_bloc.dart';
import 'package:gasapp/translations/locale_keys.g.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class Feedbackk extends StatefulWidget {
  @override
  _FeedbackkState createState() => _FeedbackkState();
}

class _FeedbackkState extends State<Feedbackk> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController textController = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

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
            color: Color(0xFF016fbe),
          ),
        ),
      ),
      body: BlocConsumer<AddFeedbackBloc, AddFeedbackState>(
        listener: (context, state) {
          if (state is AddFeedbackLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  LocaleKeys.account_page_back_to_map.tr()/*"Успешно отправлено!"*/,
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AddFeedbackInitial || state is AddFeedbackLoaded) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: screenSize(context).width * 0.1,
                  right: screenSize(context).width * 0.1,
                  bottom: screenSize(context).height * 0.1,
                ),
                child: Form(
                  key: _formKey1,
                  child: Column(
                    children: [
                      Container(
                        //padding: EdgeInsets.only(left: screenSize(context).width * 0.1, right: screenSize(context).width * 0.1, top: screenSize(context).height * 0.1, bottom: screenSize(context).height * 0.02),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LocaleKeys.feedback_sub_name.tr()/*'Письмо в техподдержку'*/,
                              style: TextStyle(
                                  color: Color(0xFF016fbe), fontSize: 30),
                            )),
                      ),
                      Container(
                          //padding: EdgeInsets.symmetric(horizontal: screenSize(context).width * 0.1),
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: screenSize(context).height * 0.1),
                          child:
                              Text(LocaleKeys.feedback_description.tr()/*'Касательно работы мобильного приложения'*/),
                        ),
                      )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenSize(context).height * 0.02),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(LocaleKeys.feedback_your_name.tr()/*'Ваше имя'*/),
                        ),
                      ),
                      Container(
                        // height: screenSize(context).height * 0.05,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.account_page_write_text.tr()/*'Введите текст'*/;
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDBC4E),
                              ),
                            ),
                            errorStyle: TextStyle(
                              color: Color(0xFFE04146),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFFDDDDDD),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenSize(context).height * 0.02),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(LocaleKeys.feedback_email.tr()/*'Электронная почта'*/),
                        ),
                      ),
                      Container(
                        // height: screenSize(context).height * 0.05,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.account_page_write_text.tr()/*'Введите текст'*/;
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDBC4E),
                              ),
                            ),
                            errorStyle: TextStyle(
                              color: Color(0xFFE04146),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFFDDDDDD),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenSize(context).height * 0.02),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(LocaleKeys.feedback_text_message.tr()/*'Текст сообщения'*/)),
                      ),
                      Container(
                        child: TextFormField(
                          maxLines: 5,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.account_page_write_text.tr()/*'Введите текст'*/;
                            }
                            return null;
                          },
                          controller: textController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDBC4E),
                              ),
                            ),
                            errorStyle: TextStyle(
                              color: Color(0xFFE04146),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFFDDDDDD),
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
                              Color(0xFF016fbe),
                            ),
                          ),
                          onPressed: () {
                            print(nameController.text);
                            print(emailController.text);
                            print(textController.text);
                            if (_formKey1.currentState.validate()) {
                              BlocProvider.of<AddFeedbackBloc>(context).add(
                                AddFeedbackGetMessage(
                                  name: nameController.text,
                                  email: emailController.text,
                                  text: textController.text,
                                  phone: "+77777777777",
                                ),
                              );
                              nameController.text = "";
                              textController.text = "";
                              emailController.text = "";
                            }
                          },
                          child: Text(LocaleKeys.feedback_send_btn.tr()/*'Отправить'*/),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (state is AddFeedbackLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text('Error');
          }
        },
      ),
    );
  }
}
