import 'package:flutter/material.dart';

Size screenSize(BuildContext context){
  return MediaQuery.of(context).size;
}

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
