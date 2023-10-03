import 'package:flutter/material.dart';


class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  // double width = 0.0;
  // double height = 0.0;
  // late ScrollController scrollController;
  // List<DateTime> currentMonthList = List.empty();
  // DateTime currentDateTime = DateTime.now();
  // List<String> todos = <String>[];
  // TextEditingController controller = TextEditingController();
  //
  // final List<String> months = [
  //   'January', 'February', 'March', 'April', 'May', 'June',
  //   'July', 'August', 'September', 'October', 'November', 'December'
  // ];
  //
  // final List<int> years = [2017, 2018, 2019, 2020, 2021, 2022, DateTime.now().year];

  List<int> selectedMonths = List.generate(84, (index) => -1); // -1 means unselected

  final List<int> years = List.generate(7, (index) => 2017 + index);
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
  ];

  void _selectMonth(int yearIndex, int monthIndex) {
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
                            print(months.length);
                            print(monthIndex);
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