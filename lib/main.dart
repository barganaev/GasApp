import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/map_bloc/map_bloc.dart';
import 'package:gasapp/screens/home_screen.dart';
import 'package:gasapp/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:io' show Platform;

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
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MapBloc>(
            create: (context) => MapBloc()..add(MapGetMarkersEvent()),
          ),
          // BlocProvider<RegionsBloc>(
          //   create: (context) => RegionsBloc()..add(RegionsGetEvent()),
          // ),
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

class _LoadingScreenState extends State<LoadingScreen> {
  BitmapDescriptor customIconActive;
  BitmapDescriptor customIconNotActive;
  @override
  void initState() {
    if (Platform.isAndroid) {
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_green.png')
          .then((onValue) {
        customIconActive = onValue;
      });
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(), 'assets/ico_agzs_gray.png')
          .then((onValue) {
        customIconNotActive = onValue;
      });
    } else {
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
                  child: HomeScreen(
                    list: state.stationsModel,
                    customIconActive: customIconActive,
                    customIconNotActive: customIconNotActive,
                  ),
                ),
              ),
              (Route<dynamic> route) => false,
            );
          } else if (state is MapErrorState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (newcontext) => BlocProvider(
                  create: (context) => MapBloc(),
                  child: HomeScreen(
                    list: [],
                  ),
                ),
              ),
            );
          }
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
