import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gasapp/blocs/info_bloc/info_bloc.dart';
import 'package:gasapp/blocs/map_bloc/map_bloc.dart';
import 'package:gasapp/blocs/regions_bloc/regions_bloc.dart';
import 'package:gasapp/screens/home_screen.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:io' show Platform;

import 'blocs/list_of_stations_bloc/list_of_stations_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('ru', ''), // Russian, no country code
      ],
      locale: const Locale('ru'),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MapBloc>(
            lazy: false,
            create: (context) => MapBloc()..add(MapGetMarkersEvent()),
          ),
          BlocProvider<InfoBloc>(
            lazy: false,
            create: (context) => InfoBloc()..add(InfoGetEvent()),
          ),
          BlocProvider<RegionsBloc>(
            lazy: false,
            create: (context) => RegionsBloc()..add(RegionsGetEvent()),
          ),
          BlocProvider<ListOfStationsBloc>(
            lazy: false,
            create: (context) => ListOfStationsBloc()
              ..add(ListOfStationsGetEvent(regionId: "1")),
          ),
        ],
        child: LoadingScreen(),
      ),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

//    <key>NSLocationAlwaysUsageDescription</key>
// <string>Your location is required</string>

class _LoadingScreenState extends State<LoadingScreen> {
  BitmapDescriptor customIconActive;
  BitmapDescriptor customIconNotActive;
  @override
  void initState() {
    if (Platform.isAndroid) {
      print('Android is true');
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_green_android.png')
          .then((onValue) {
        customIconActive = onValue;
      });
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_gray_android.png' /*'assets/ico_agzs_gray_22_32_android.png'*/)
          .then((onValue) {
        customIconNotActive = onValue;
      });
    } else {
      print('IOS is true');
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_green_ios.png')
          .then((onValue) {
        customIconActive = onValue;
      });
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_gray_ios.png')
          .then((onValue) {
        customIconNotActive = onValue;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          if (state is MapLoadedState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (newcontext) => BlocProvider.value(
                  value: BlocProvider.of<MapBloc>(context),
                  child: BlocProvider<InfoBloc>.value(
                    value: BlocProvider.of<InfoBloc>(context),
                    // create: (ncontext) => InfoBloc()..add(InfoGetEvent()),
                    child: BlocProvider<RegionsBloc>.value(
                      value: BlocProvider.of<RegionsBloc>(context),
                      child: BlocProvider<ListOfStationsBloc>.value(
                        value: BlocProvider.of<ListOfStationsBloc>(context),
                        child: HomeScreen(
                          list: state.stationsModel,
                          customIconActive: customIconActive,
                          customIconNotActive: customIconNotActive,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              (Route<dynamic> route) => false,
            );
          }
          // else if (state is MapErrorState) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (newcontext) => BlocProvider(
          //         create: (context) => MapBloc(),
          //         child: HomeScreen(
          //           list: [],
          //         ),
          //       ),
          //     ),
          //   );
          // }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Image.asset(
                'assets/scr_1.png',
                fit: BoxFit.fill,
                height: screenSize(context).height,
                width: screenSize(context).width,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize(context).height * 0.8,
                  left: screenSize(context).width * 0.45,
                ),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF046cbc)),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
