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
    onTap: () {},
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
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#523735"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#c9b2a6"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#dcd2be"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#ae9e90"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#93817c"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#a5b076"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#447530"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#fdfcf8"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f8c967"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#e9bc62"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e98d58"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#db8555"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#806b63"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8f7d77"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#b9d3c2"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#92998d"
      }
    ]
  }
]
  ''';
