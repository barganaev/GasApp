import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/check_number_bloc/check_number_bloc.dart';
import 'package:gasapp/blocs/login_bloc/login_bloc.dart';
import 'package:gasapp/screens/verify_screen.dart';
import 'package:gasapp/translations/locale_keys.g.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  double screenWidth;
  double screenHeight;
//  RegExp iinexp = new RegExp(r"^[0-9]{12}$"); //TODO REGEX VALIDATION FORM
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController phoneController = new TextEditingController();
  // var maskFormatter = new MaskTextInputFormatter(mask: '+7 (7**) ***-**-**', filter: { "*": RegExp(r'[0-9]')}, );
  // var maskFormatter = new MaskTextInputFormatter(mask: '+7 (7**)*** ** **', filter: { "*": RegExp(r'[0-9]')}, );
  final FocusNode _nodeText1 = FocusNode();
  bool autovalidate = false;

  @override
  void initState() {
    phoneController.text = "+7";
    super.initState();
  }

  // @override
  // void dispose() {
  //   // FocusScope.of(context).unfocus();
  //   // super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SingleChildScrollView(
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
                          LocaleKeys.account_page_enter.tr()/*"????????"*/,
                          style: TextStyle(
                            color: Color(0xFF016fbe),
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
                          LocaleKeys.account_page_description_1.tr()/*"???????????? ?????????????? ?????? ?????????????????? ?????????????????????? ?????????????? ?????????? ???????????????????? ???????????????????? ??????????????????????????"*/,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize(context).height * 0.2,
                ),
                BlocProvider<CheckNumberBloc>(
                  create: (context) => CheckNumberBloc(),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: this._formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: phoneController,
                                autofocus: false,
                                maxLines: 1,
                                focusNode: _nodeText1,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true),
                                autocorrect: false,
                                validator: (String inValue) {
                                  if (inValue == null || inValue.isEmpty) {
                                    return LocaleKeys.account_page_please_enter_number.tr()/*'????????????????????, ?????????????? ?????? ??????????'*/;
                                  }
                                  return null;
                                },
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
                                  labelText: LocaleKeys.account_page_phone_number.tr()/*"?????????? ????????????????"*/,
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
                              BlocConsumer<CheckNumberBloc, CheckNumberState>(
                                listener: (context, state) {
                                  if (state is CheckNumberLoadedState) {
                                    print("phoneController.text");
                                    print(phoneController.text);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                          create: (context) => LoginBloc(),
                                          child: PhoneAuthVerify(
                                            phoneNumber: phoneController.text,
                                          ),
                                        ),
                                      ),
                                    );
                                    // );
                                  } else if (state is CheckNumberErrorState) {
                                    print("phoneController.text222");
                                    print(phoneController.text);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(LocaleKeys.account_page_number_not_defined.tr()/*'?????????? ???? ??????????????????'*/),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    // Scaffold.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     backgroundColor: Colors.red,
                                    //     content: Text('???????????????? ??????????'),
                                    //     duration: Duration(seconds: 2),
                                    //   ),
                                    // );

                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         BlocProvider<LoginBloc>(
                                    //       create: (context) => LoginBloc(),
                                    //       child: PhoneAuthVerify(
                                    //         phoneNumber: phoneController.text,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // );
                                  }
                                },
                                builder: (context, state) {
                                  if (state is CheckNumberLoadingState) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 18.0),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  return Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState.validate()) {
                                          print(phoneController.text);
                                          BlocProvider.of<CheckNumberBloc>(
                                                  context)
                                              .add(
                                            CheckPhoneNumberEvent(
                                              phoneNumber: phoneController.text,
                                            ),
                                          );
                                        } else {
                                          print("NOT VALID");
                                        }
                                      },
                                      child: Text(
                                        LocaleKeys.account_page_next.tr()/*"??????????"*/,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xFF016fbe),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize(context).height * 0.05),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF016fbe)),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(LocaleKeys.account_page_back_to_map.tr()/*'?????????????????? ???? ??????????'*/)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
