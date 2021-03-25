import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gasapp/screens/account_screen.dart';
import 'package:gasapp/screens/verify_screen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  double screenWidth;
  double screenHeight;
//  RegExp iinexp = new RegExp(r"^[0-9]{12}$"); //TODO REGEX VALIDATION FORM
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController iinController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool autovalidate = false;
  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.pink,
                margin: EdgeInsets.only(top: screenHeight * 0.06),
                // padding: EdgeInsets.only(bottom: screenHeight * 0.15),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Вход",
                        style: TextStyle(
                          color: Color(0xFF2295C1),
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Чтобы продолжить\nпожалуйста авторизуйтесь",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              // Center(
              //   child: Text("Войти"),
              // )
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // padding: EdgeInsets.only(top: screenHeight * 0.2),
                    // color: Colors.amber,
                    // padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          autovalidate: autovalidate,
                          key: this._formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: iinController,
                                autofocus: false,
                                maxLines: 1,
                                focusNode: _nodeText1,
                                keyboardType: TextInputType.number,
                                autocorrect: false,
                                validator: (String inValue) {},
                                onSaved: (String inValue) {},
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFDBC4E),
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Color(0xFFE04146),
                                  ),
                                  labelText: "Номер телефона",
                                  hintStyle: TextStyle(
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFDDDDDD),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Color(0xFF172F6B),
                                  fontSize: 18.0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PhoneAuthVerify()/*AccountScreen()*/,
                                      ),
                                    );
                                  } /*async {}*/,
                                  child: Text(
                                    "Далее",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFF2295C1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
