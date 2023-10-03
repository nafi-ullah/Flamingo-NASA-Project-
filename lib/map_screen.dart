import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key,
    required this.dummyData,
    //required this.Longitude,
  });

  //final String Latitude;
  //final String Longitude;
  final List<Map<String, double>> dummyData;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  // String lati;
  // String longi;


  // LatLng point = LatLng(23.765027, 90.430152);
  //LatLng point = LatLng(double.parse(widget.Latitude), double.parse(widget.Longitude));
  @override
  Widget build(BuildContext context) {
    List<Map<String, double>> dummyData1 = [
      {"longitude": 24.872132, "latitude": 13.856387},
      {"longitude": 25.777354, "latitude": 14.848181},
      {"longitude": 25.062602, "latitude": 13.651790},
      {"longitude": 23.787669, "latitude": 14.892949},
      {"longitude": 22.937620, "latitude": 13.123400},
      {"longitude": 24.866939, "latitude": 15.082518},
      {"longitude": 23.760173, "latitude": 14.231397},
      {"longitude": 23.124563, "latitude": 13.409436},
      {"longitude": 22.808965, "latitude": 14.586475},
      {"longitude": 22.471954, "latitude": 13.319347},
    ];

    List<Map<String, double>> dummyData2 = [
      {"longitude": 25.872132, "latitude": 13.856387},
      {"longitude": 22.777354, "latitude": 14.848181},
      {"longitude": 23.062602, "latitude": 13.651790},
      {"longitude": 24.787669, "latitude": 14.892949},
      {"longitude": 23.937620, "latitude": 13.123400},
      {"longitude": 23.866939, "latitude": 15.082518},
      {"longitude": 24.760173, "latitude": 14.231397},
      {"longitude": 23.124563, "latitude": 13.409436},
      {"longitude": 25.808965, "latitude": 14.586475},
      {"longitude": 23.471954, "latitude": 13.319347},
    ];

    List<Marker> markers = [];

    for (var data in widget.dummyData) {
      markers.add(
        Marker(
          width: 50.0,
          height: 50.0,
          point: LatLng(data["latitude"]!, data["longitude"]!),
          builder: (ctx) => Container(
            child: Image.asset('assets/images/fireimage.png'),
          ),
        ),
      );
    }

    return  FlutterMap(
          options: MapOptions(
            //center: point,
            center: LatLng(double.parse("24.872132"), double.parse("13.856387")),
            zoom: 8.0,
          ),

          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
                markers: markers
            )
          ],

    );
  }
}

