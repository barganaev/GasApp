// import 'package:flutter/material.dart';

// import 'login.dart';

// class HomeDrawer extends StatefulWidget {
//   @override
//   _HomeDrawerState createState() => _HomeDrawerState();
// }

// class _HomeDrawerState extends State<HomeDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: ListView(children: <Widget>[
//       GestureDetector(
//         onTap: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => LogIn()));
//         },
//         child: Container(
//           padding: EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 8),
//           // color: HexColor("#31343E"),
//           color: Colors.white,
//           child: Row(
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(100.0),
//                 child: Image.asset(
//                   "assets/account_photo_default.png",
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               SizedBox(
//                 width: 8,
//               ),
//               RichText(
//                 text: TextSpan(children: [
//                   TextSpan(
//                       text: "Name Surname\n",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Montserrat',
//                           color: Colors.black87)),
//                   TextSpan(
//                       text: "@username",
//                       style: TextStyle(
//                           fontFamily: 'Montserrat', color: Colors.black54)),
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Divider(height: 1, thickness: 1, color: Colors.blueGrey[900]),
//       Container(
//         height: MediaQuery.of(context).size.height,
//         color: Colors.white,
//         child: Column(
//           children: <Widget>[
//             // List items goes here...
//           ],
//         ),
//       ),
//     ]));
//   }
// }