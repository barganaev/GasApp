// SEARCH BAR

// Padding(
//   padding: EdgeInsets.only(
//     top: MediaQuery.of(context).size.height * 0.1,
//     left: MediaQuery.of(context).size.width * 0.05,
//     right: MediaQuery.of(context).size.width * 0.05,
//   ),
//   child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       height: MediaQuery.of(context).size.height * 0.08,
//       width: MediaQuery.of(context).size.width * 0.9,
//       //color: Colors.white,
//       child: Center(
//         child: TextField(
//           decoration: InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: Icon(Icons.search),
//               hintText: 'Where are you going to?',
//               hintStyle: TextStyle(
//                   fontWeight: FontWeight.bold, color: Colors.black)),
//         ),
//       ),),
// ),
//
//
//
//
//
// // body

// BlocBuilder<MapBloc, MapState>(
//             builder: (context, state) {
//               if (state is MapLoadedState) {
// return
// Stack(
//                   children: [
//                     GoogleMap(
//                       myLocationEnabled: true,
//                       myLocationButtonEnabled: false,
//                       mapType: mapTypeNormal ? MapType.normal : MapType.hybrid,
//                       onMapCreated: _onMapCreated,
//                       markers: markers(context),
//                       initialCameraPosition: positions[indexOfCity],
//                       mapToolbarEnabled: false,
//                       zoomControlsEnabled: true,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: MediaQuery.of(context).size.height * 0.04,
//                       ),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 5),
//                             child: IconButton(
//                               onPressed: () {
//                                 Scaffold.of(context).openDrawer();
//                               },
//                               icon: Icon(
//                                 Icons.menu,
//                                 size: 30,
//                                 // color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white,
//                             ),
//                             height: MediaQuery.of(context).size.height * 0.05,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 10),
//                                   child: Icon(Icons.search),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.only(right: 10),
//                                   width: screenSize(context).width * 0.65,
//                                   child: DropdownButton<String>(
//                                     underline: Container(),
//                                     value: selectedCountry,
//                                     isExpanded: true,
//                                     items: cities.map((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(
//                                           value,
//                                           style: TextStyle(color: Colors.black),
//                                         ),
//                                       );
//                                     }).toList(),
//                                     onChanged: onChangedCallback,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),

//floating

// after body

//     return Stack(
//       children: [
//         GoogleMap(
//           myLocationEnabled: true,
//           myLocationButtonEnabled: false,
//           mapType: mapTypeNormal ? MapType.normal : MapType.hybrid,
//           onMapCreated: _onMapCreated,
//           // markers: markers(context),
//           initialCameraPosition: positions[indexOfCity],
//           mapToolbarEnabled: true,
//           zoomControlsEnabled: true,
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             top: MediaQuery.of(context).size.height * 0.04,
//           ),
//           child: Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 5),
//                 child: IconButton(
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                   icon: Icon(
//                     Icons.menu,
//                     size: 30,
//                     // color: Colors.white,
//                   ),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 height: MediaQuery.of(context).size.height * 0.05,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       child: Icon(Icons.search),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(right: 10),
//                       width: screenSize(context).width * 0.65,
//                       child: DropdownButton<String>(
//                         underline: Container(),
//                         value: selectedCountry,
//                         isExpanded: true,
//                         items: cities.map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: onChangedCallback,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
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
//   },
// ),

// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   BitmapDescriptor customIconActive;
//   BitmapDescriptor customIconNotActive;
//   @override
//   void initState() {
//     if (Platform.isAndroid) {
//       print('Android is true');
//       BitmapDescriptor.fromAssetImage(
//               ImageConfiguration(), 'assets/ico_agzs_green_android.png')
//           .then((onValue) {
//         customIconActive = onValue;
//       });
//       BitmapDescriptor.fromAssetImage(ImageConfiguration(),
//               'assets/ico_agzs_gray_android.png' /*'assets/ico_agzs_gray_22_32_android.png'*/)
//           .then((onValue) {
//         customIconNotActive = onValue;
//       });
//     } else {
//       print('IOS is true');
//       BitmapDescriptor.fromAssetImage(
//               ImageConfiguration(), 'assets/ico_agzs_green_ios.png')
//           .then((onValue) {
//         customIconActive = onValue;
//       });
//       BitmapDescriptor.fromAssetImage(
//               ImageConfiguration(), 'assets/ico_agzs_gray_ios.png')
//           .then((onValue) {
//         customIconNotActive = onValue;
//       });
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<MapBloc, MapState>(
//         listener: (lcontext, state) {
//           if (state is MapLoadedState) {
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (newcontext) => BlocProvider.value(
//                   // value: BlocProvider.of<MapBloc>(context),
//                   // child: BlocProvider<InfoBloc>.value(
//                   value: BlocProvider.of<InfoBloc>(context),
//                   child: BlocProvider<RegionsBloc>.value(
//                     value: BlocProvider.of<RegionsBloc>(context),
//                     child: HomeScreen(
//                         // list: state.stationsModel,
//                         // customIconActive: customIconActive,
//                         // customIconNotActive: customIconNotActive,
//                         ),
//                   ),
//                 ),
//                 // ),
//               ),
//               (Route<dynamic> route) => false,
//             );
//           }
//         },
//         builder: (context, state) {
//           return Stack(
//             children: [
//               Image.asset(
//                 'assets/scr_1_old.png',
//                 fit: BoxFit.fill,
//                 height: screenSize(context).height,
//                 width: screenSize(context).width,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: screenSize(context).height * 0.8,
//                   left: screenSize(context).width * 0.45,
//                 ),
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF046cbc)),
//                   backgroundColor: Colors.white,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
