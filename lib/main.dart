import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasapp/blocs/map_bloc/map_bloc.dart';
import 'package:gasapp/screens/home_screen.dart';
import 'package:gasapp/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<MapBloc>(
        create: (context) => MapBloc()..add(MapGetMarkersEvent()),
        child: LoadingScreen(),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (newcontext) => BlocProvider.value(
                value: BlocProvider.of<MapBloc>(context),
                child: HomeScreen(),
              ),
            ),
          );
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
