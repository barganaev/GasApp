import 'package:flutter/cupertino.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

// double screenWidthSize(BuildContext context) {
//    var physicalPixelWidth = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;
//    return physicalPixelWidth;
// }
//
// double screenHeightSize(BuildContext context) {
//   var physicalPixelHeight = MediaQuery.of(context).size.height * MediaQuery.of(context).devicePixelRatio;
//   return physicalPixelHeight;
// }
