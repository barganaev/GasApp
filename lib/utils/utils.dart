import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class JsonUtils {
  static String mapJson = '''
  {
  "cities": [
    {
        "Актау": [
            {
                "12-8": [
                    {
                        "isActive": true,
                        "lon": 51.155306,
                        "lat": 43.663441,
                        "title": "КазМунайГаз",
                        "date": "13:03 20.03.2021"
                    }
                ],
                "28-a": [
                    {
                        "isActive": false,
                        "lon": 52.843327,
                        "lat": 43.342095,
                        "title": "КазМунайГаз",
                        "date": "13:03 20.03.2021"
                    }
                ]
            }
        ],
        "Жанаозен": [
            {
                "3-4": [
                    {
                        "isActive": true,
                        "lon": 43,
                        "lat": 44,
                        "title": "КазМунайГаз",
                        "date": "13:03 20.03.2021"
                    }
                ],
                "4-6": [
                    {
                        "isActive": false,
                        "lon": 52.873188,
                        "lat": 43.357568,
                        "title": "КазМунайГаз",
                        "date": "13:03 20.03.2021"
                    }
                ]
            }
        ]
    }
  ]
}
''';
}

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
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.668038, 51.194485),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  ),
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.666453, 51.154716),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.641045, 51.181734),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  ),
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
