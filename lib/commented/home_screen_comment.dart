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
//     return Stack(
//       children: [
//         Image.asset(
//           'assets/scr_1.png',
//           fit: BoxFit.fill,
//           height: screenSize(context).height,
//           width: screenSize(context).width,
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             top: screenSize(context).height * 0.8,
//             left: screenSize(context).width * 0.45,
//           ),
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF046cbc)),
//             backgroundColor: Colors.white,
//           ),
//         ),
//       ],
//     );
//   },
// ),
