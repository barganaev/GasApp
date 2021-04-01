import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:gasapp/blocs/info_bloc/info_bloc.dart';
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
            )),
      ),
      body: BlocConsumer<InfoBloc, InfoState>(
        listener: (context, state){
          if(state is InfoError){
            // print('Phoneix here');
            // Phoenix.rebirth(context);
          }
        },
        builder: (context, state) {
          if (state is InfoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InfoLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: screenSize(context).width * 0.1,
                      right: screenSize(context).width *
                          0.1, /*top: screenSize(context).height * 0.1*/
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'О приложении',
                          style:
                              TextStyle(color: Color(0xFF2295C1), fontSize: 30),
                        )),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize(context).width * 0.08,
                          vertical: screenSize(context).height * 0.02),
                      child: Html(
                        data: state.infoModel.text,
                        style: {
                          "p": Style(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                            padding: const EdgeInsets.all(16),
                            fontSize: FontSize.larger,
                          ),
                          "p > a": Style(
                            textDecoration: TextDecoration.none,
                          ),
                          "h1": Style(
                            fontFamily: 'serif',
                            backgroundColor: Colors.black,
                            color: Colors.white,
                          ),
                        },
                      )),
                ],
              ),
            );
          } else if(state is InfoError){
            return Center(child: Text('Error'));
          }else {
            return Text('Last error');
          }
        },
      ),
    );
  }
}
