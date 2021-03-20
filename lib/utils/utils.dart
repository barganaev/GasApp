import 'package:google_maps_flutter/google_maps_flutter.dart';

List<String> cities = [
  'Ақтау қаласы',
  'Жаңаөзен қаласы',
  'Құрық ауданы',
  'Бейнеу ауданы'
];

List<CameraPosition> positions = [
  CameraPosition(
    target: LatLng(43.655357, 51.156099),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(43.342015, 52.857237),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(43.178096, 51.680373),
    zoom: 14,
  ),
  CameraPosition(
    target: LatLng(45.307847, 55.183664),
    zoom: 13,
  ),
];

Set<Marker> markers = {
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.667631, 51.150840),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  )
};

String mapStyle = '''
  [
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
  ]
  ''';