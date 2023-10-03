import 'dart:math';

import 'package:flutter/material.dart';


class Timeline extends StatefulWidget {
  const Timeline({super.key,
    required this.CoordinateData,
    //required this.Longitude,
  });
  final void Function(List<Map<String, double>>) CoordinateData;

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

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

  List<List<Map<String, double>>> listOfLists = List.empty();
  int value = 0;


  List<int> selectedMonths = List.generate(84, (index) => -1); // -1 means unselected

  final List<int> years = List.generate(7, (index) => 2017 + index);
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
  ];

   _selectMonth(int yearIndex, int monthIndex) {
    setState(() {
      // Reset the selected state for all months in the same year
      for (int i = 0; i < months.length; i++) {
        if (i != monthIndex) {
          selectedMonths[yearIndex * months.length + i] = -1;
        }
      }

      // Toggle the selected state for the clicked month
      selectedMonths[yearIndex * months.length + monthIndex] =
      selectedMonths[yearIndex * months.length + monthIndex] == -1 ? yearIndex : -1;

      final random = Random();

      // Define the range for the random number (inclusive)
      int min = 0; // Minimum value
      int max = 1; // Maximum value

      // Generate a random number within the specified range
      int randomNumber = min + random.nextInt(max - min + 1);

      value= randomNumber;
      //return randomNumber;
    });

  }




  Widget MonthShow() {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
          for (int yearIndex = 0; yearIndex < years.length; yearIndex++)
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int monthIndex = 0; monthIndex < months.length; monthIndex++)
                        GestureDetector(
                          onTap: () {
                            _selectMonth(yearIndex, monthIndex);
                            setState(() {
                              widget.CoordinateData(listOfLists[value]);
                            });


                          },
                          child: Container(
                            width: 80, // Adjust the width as needed
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(),
                              color: selectedMonths[yearIndex * months.length + monthIndex] == yearIndex
                                  ? Colors.pink
                                  : monthIndex == 9 && yearIndex == 6? Colors.green : Colors.blueGrey,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    '${months[monthIndex]}',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    ' ${years[yearIndex]}',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //widget.CoordinateData(dummyData1);
    listOfLists = [
      dummyData1,
      dummyData2
    ];

   // width = MediaQuery.of(context).size.width;
   // height = MediaQuery.of(context).size.height;
    return MonthShow();
    //     Stack(
    //     children: <Widget>[
    // topView(),
    // //todoList()
    // ],
    // ),


  }

}