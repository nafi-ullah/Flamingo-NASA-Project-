import 'package:flame_forecast/map_screen.dart';
import 'package:flame_forecast/timeline.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
void ExecuteTimeline(){

}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('F L A M E Forecast'),
    centerTitle: true,
    ),
    body: Stack(
    children: <Widget>[
    // Other widgets in the Stack
      MapScreen(),
    Positioned(
    bottom: 20.0, // Place the widget at the bottom
    left: 0.0, // You can adjust the left/right positioning as needed
    child: Container(
        width: 360,
        height: 50,
        color: Colors.black26,
      child: Timeline(),
    ), // Replace with your widget
    ),
    ],
    )
    );
  }
}
