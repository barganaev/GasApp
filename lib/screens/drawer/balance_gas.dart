import 'package:flutter/material.dart';

class GasBalance extends StatelessWidget {
  String title;
  GasBalance({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Text(this.title),
      ),
    );
  }
}
