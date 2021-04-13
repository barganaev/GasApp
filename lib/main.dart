import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gasapp/app_builder.dart';
import 'package:gasapp/blocs/info_bloc/info_bloc.dart';
import 'package:gasapp/blocs/map_bloc/map_bloc.dart';
import 'package:gasapp/blocs/regions_bloc/regions_bloc.dart';
import 'package:gasapp/screens/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gasapp/translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ru'), Locale('kk', 'KZ')],
      path: 'assets/translations',
      fallbackLocale: Locale('ru'),
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.setLocale(Locale('ru'));
    print(context.locale.toString());
    print("context.locale.toString()");
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      // [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: context.supportedLocales,
      // [
      //   const Locale('ru', ''), // Russian, no country code
      //   const Locale('kk', 'KZ'),
      // ],
      locale: context.locale, //const Locale('kk', 'KZ'), context.locale
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MapBloc>(
            lazy: false,
            create: (context) => MapBloc()..add(MapGetMarkersEvent()),
          ),
          BlocProvider<InfoBloc>(
            create: (context) => InfoBloc()..add(InfoGetEvent()),
          ),
          BlocProvider<RegionsBloc>(
            lazy: false,
            create: (context) => RegionsBloc()..add(RegionsGetEvent()),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
