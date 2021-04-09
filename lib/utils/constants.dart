import 'package:flutter/cupertino.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/*
Size screenWidthSize(BuildContext context) {
   physicalPixelWidth = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;
   return physicalPixelWidth;
}*/
