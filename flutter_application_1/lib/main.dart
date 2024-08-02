import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widget/new_case.dart';
import 'package:flutter_application_1/widget/show_newrecoved.dart';
import 'package:flutter_application_1/widget/total_case.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'widget/showdate.dart';
import 'widget/show_recoved.dart';
import 'widget/show_newrecoved.dart';
import 'widget/total_death.dart';
import 'widget/new_death.dart';
import 'widget/new_casewalkin.dart';

void main() {
  runApp(const MyApp());
}

class covidData {
  int year = 0;
  int weeknum = 0;
  int new_case = 0;
  int total_case = 0;
  int new_case_excludeabroad = 0;
  int total_case_excludeabroad = 0;
  int new_recovered = 0;
  int total_recovered = 0;
  int new_death = 0;
  int total_death = 0;
  int case_foreign = 0;
  int case_prison = 0;
  int case_walkin = 0;
  int case_new_prev = 0;
  int case_new_diff = 0;
  int death_new_prev = 0;
  int death_new_diff = 0;
  String update_date = "";

  void mapData(Map<String, dynamic> dataIn) {
    year = dataIn['year'];
    weeknum = dataIn['weeknum'];
    new_case = dataIn['new_case'];
    total_case = dataIn['total_case'];
    new_case_excludeabroad = dataIn['new_case_excludeabroad'];
    total_case_excludeabroad = dataIn['total_case_excludeabroad'];
    new_recovered = dataIn['new_recovered'];
    total_recovered = dataIn['total_recovered'];
    new_death = dataIn['new_death'];
    total_death = dataIn['total_death'];
    case_foreign = dataIn['case_foreign'];
    case_prison = dataIn['case_prison'];
    case_walkin = dataIn['case_walkin'];
    case_new_prev = dataIn['case_new_prev'];
    case_new_diff = dataIn['case_new_diff'];
    death_new_prev = dataIn['death_new_prev'];
    death_new_diff = dataIn['death_new_diff'];
    update_date = dataIn['update_date'];
  }

  Future<dynamic> getData() async {
    String uri = "https://covid19.ddc.moph.go.th/api/Cases/today-cases-all";
    final response = await http.get(Uri.parse(uri));
    Map<String, dynamic> data =
        jsonDecode(response.body.substring(1, response.body.length - 1));
    mapData(data);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Covid-19 Thailand'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 50,
                  child: ShowDate(width: 150, height: 60 , color: Color.fromARGB(255, 0, 255, 4),),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NewRecovered(
                        width: 190,
                        height: 150,
                        head: "New Recover",
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        color: Color.fromARGB(255, 255, 0, 85),
                      ),
                      TotalRecovered(
                        width: 190,
                        height: 150,
                        head: "Total Recover",
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        color: Color.fromARGB(255, 255, 230, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NewCase(
                        width: 190,
                        height: 150,
                        head: "New Case",
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        color: Color.fromARGB(255, 4, 0, 255),
                      ),
                      TotalCase(
                        width: 190,
                        height: 150,
                        head: "Total Case",
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        color: Color.fromARGB(255, 30, 255, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CaseWalkin(
                        width: 127,
                        height: 80,
                        head: "Case Walkin",
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(0),
                        ),
                        color: Color.fromARGB(255, 255, 0, 51),
                      ),
                      NewDeath(
                        width: 127,
                        height: 80,
                        head: "New Death",
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        color: Color.fromARGB(255, 10, 194, 255),
                      ),
                      TotalDeath(
                        width: 127,
                        height: 80,
                        head: "Total Death",
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(12.0),
                        ),
                        color: Color.fromARGB(255, 255, 153, 0),
                      ),
                    ],
                  ),
                )
              ]),
        ));
  }
}
