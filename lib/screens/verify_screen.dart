import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/login_bloc/login_bloc.dart';
import 'package:gasapp/blocs/self_station_bloc/self_station_bloc.dart';пше
import 'package:gasapp/screens/account_screen.dart';
import 'package:gasapp/screens/home_screen.dart';
import 'package:gasapp/utils/constants.dart';
//import 'package:flutter_firebase/chat/lets_text.dart';
//import 'package:flutter_firebase/providers/phone_auth.dart';
//import 'package:flutter_firebase/utils/constants.dart';
//import 'package:flutter_firebase/utils/widgets.dart';

class PhoneAuthVerify extends StatefulWidget {
  PhoneAuthVerify({this.phoneNumber});

  String phoneNumber;
  final Color cardBackgroundColor = Color(0xFF5897cf) /*Color(0xFFFCA967)*/;
  //final String logo = Assets.firebase;
  final String appName = "Вход";

  @override
  _PhoneAuthVerifyState createState() => _PhoneAuthVerifyState();
}

class _PhoneAuthVerifyState extends State<PhoneAuthVerify> {
  double _height, _width, _fixedPadding;

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  String code = "";

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "scaffold-verify-phone");

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _fixedPadding = _height * 0.025;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadedState) {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => AccountScreen()));
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SelfStationBloc()
                        ..add(
                          SelfStationGetEvent(
                            token: state.token,
                            regionId: "1",
                          ),
                        ),
                      child: AccountScreen(),
                    ),
                  ),
                  (Route<dynamic> route) => route.isFirst);
            } else if (state is LoginErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Неверный номер'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginInitialState) {
              return Center(
                child: SingleChildScrollView(
                  child: _getBody(),
                ),
              );
            } else if (state is LoginLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: SingleChildScrollView(
                child: _getBody(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getBody() => Card(
        color: widget.cardBackgroundColor,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: SizedBox(
          height: _height * 8 / 10,
          width: _width * 8 / 10,
          child: Builder(builder: (BuildContext context) => _getColumnBody()),
        ),
      );

  Widget _getColumnBody() => Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(_fixedPadding),
            // child: PhoneAuthWidgets.getLogo(
            //     logoPath: widget.logo, height: _height * 0.2),
          ),

          // AppName:
          Text(widget.appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700)),

          SizedBox(height: 20.0),

          Row(
            children: <Widget>[
              SizedBox(width: 16.0),
              Expanded(
                  child: Center(
                      child: Text(
                'Пожалуйста, введите одноразовый пароль полученный устройством',
                style: TextStyle(color: Colors.white),
              ))),
              SizedBox(width: 16.0),
            ],
          ),
          SizedBox(height: 16.0),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              getPinField(
                  key: "1",
                  focusNode: focusNode1,
                  controller: textEditingController1),
              SizedBox(width: 5.0),
              getPinField(
                  key: "2",
                  focusNode: focusNode2,
                  controller: textEditingController2),
              SizedBox(width: 5.0),
              getPinField(
                  key: "3",
                  focusNode: focusNode3,
                  controller: textEditingController3),
              SizedBox(width: 5.0),
              getPinField(
                  key: "4",
                  focusNode: focusNode4,
                  controller: textEditingController4),
              SizedBox(width: 5.0),
              // getPinField(key: "5", focusNode: focusNode5),
              // SizedBox(width: 5.0),
              // getPinField(key: "6", focusNode: focusNode6),
              // SizedBox(width: 5.0),
            ],
          ),

          SizedBox(height: 32.0),
          RaisedButton(
            elevation: 16.0,
            onPressed: () {
              String codeNumber = textEditingController1.text +
                  textEditingController2.text +
                  textEditingController3.text +
                  textEditingController4.text;
              BlocProvider.of<LoginBloc>(context).add(
                AuthLoginEvent(
                  phoneNumber: widget.phoneNumber,
                  password: codeNumber,
                ),
              ); //+77078891693 widget.phoneNumber +77756697236
            } /*signIn*/,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Подтвердить',
                style: TextStyle(
                    color: widget.cardBackgroundColor, fontSize: 18.0),
              ),
            ),
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize(context).height * 0.1),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Назад',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
          // RaisedButton(
          //   color: Color(0xFF5897cf),
          //   child: Text('Назад', style: TextStyle(color: Colors.white),),
          //   onPressed: (){
          //     Navigator.pop(context);
          //   }
          // )
        ],
      );

  _showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text('$text'),
      duration: Duration(seconds: 2),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  signIn() {
    if (code.length != 6) {
      _showSnackBar("Invalid OTP");
    }
  }

  Widget getPinField(
          {String key,
          FocusNode focusNode,
          TextEditingController controller}) =>
      SizedBox(
        height: 40.0,
        width: 35.0,
        child: TextFormField(
          key: Key(key),
          expands: false,
          keyboardType: TextInputType.numberWithOptions(signed: true),
//          autofocus: key.contains("1") ? true : false,
          autofocus: false,

          focusNode: focusNode,
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (String value) {
            if (value.length == 1) {
              code += value;
              switch (code.length) {
                case 1:
                  FocusScope.of(context).requestFocus(focusNode2);
                  break;
                case 2:
                  FocusScope.of(context).requestFocus(focusNode3);
                  break;
                case 3:
                  FocusScope.of(context).requestFocus(focusNode4);
                  break;
                // case 4:
                //   FocusScope.of(context).requestFocus(focusNode5);
                //   break;
                // case 5:
                //   FocusScope.of(context).requestFocus(focusNode6);
                //   break;
                default:
                  FocusScope.of(context).requestFocus(FocusNode());
                  break;
              }
            }
          },
          maxLengthEnforced: false,
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      );

  onStarted() {
    _showSnackBar("PhoneAuth started");
  }

  onCodeSent() {
    _showSnackBar("OPT sent");
  }

  onCodeResent() {
    _showSnackBar("OPT resent");
  }

  onVerified() async {
    // await Future.delayed(Duration(seconds: 1));
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => AccountScreen(),
    //   ),
    // );
  }

  onAutoRetrievalTimeOut() {
    _showSnackBar("PhoneAuth autoretrieval timeout");
  }
}
