import 'package:flutter/material.dart';


class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  final List<int> years = [2017, 2018, 2019, 2020, 2021, 2022, DateTime.now().year];






  Widget MonthShow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
          for (int year in years)
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (String month in months)
                        Container(

                          width: 80, // Adjust the width as needed
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            color: month.toString() == "October" && year.toString() == "2023" ?  Colors.pink : Colors.blueGrey,
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  '$month',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Center(
                                child: Text(
                                  ' $year',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
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