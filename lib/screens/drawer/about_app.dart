import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:gasapp/blocs/info_bloc/info_bloc.dart';
import 'package:gasapp/translations/locale_keys.g.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';

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
        title: Text('Настройки', style: TextStyle(color: Color(0xFF016fbe))),
        centerTitle: true,
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
                    padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.01, horizontal: screenSize(context).width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleKeys.settings_lang.tr()/*'Выбранный язык'*/),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5
                          ),
                          onPressed: () async {
                            if (context.locale == Locale('ru')) {
                              await context.setLocale(Locale('kk', 'KZ'));
                            } else {
                              await context.setLocale(Locale('ru'));
                            }
                          },
                          child: Text(context.locale == Locale('ru')
                              ? "Русский язык"
                              : "Қазақ тілі"),
                        ),
                      ],
                    ),
                  ),
                  // ListTile(
                  //   onTap: () async {
                  //     if (context.locale == Locale('ru')) {
                  //       await context.setLocale(Locale('kk', 'KZ'));
                  //     } else {
                  //       await context.setLocale(Locale('ru'));
                  //     }
                  //   },
                  //    leading: Image.asset(context.locale == Locale('ru') ? 'assets/flag_kz.png' : 'assets/flag_ru.png', height: screenSize(context).height * 0.05,),
                  //   // contentPadding:
                  //   //     EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2),
                  //   title: Text(context.locale == Locale('ru')
                  //       ? "Қазақ тілі"
                  //       : "Русский язык"), //Text("about").tr(),  ??
                  // ),

                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.01, horizontal: screenSize(context).width * 0.05),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text('Push-уведомление'),
                  //       CupertinoSwitch(value: true, onChanged: (bool value){})
                  //     ],
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenSize(context).height * 0.01),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: screenSize(context).width * 0.1,
                      right: screenSize(context).width *
                          0.1, /*top: screenSize(context).height * 0.1*/
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LocaleKeys.about.tr()/*'О приложении'*/,
                          style:
                              TextStyle(color: Color(0xFF2295C1), fontSize: 24),
                        )),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize(context).width * 0.04,
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
