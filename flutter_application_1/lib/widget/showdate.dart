import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widget/componant/box.dart';
import 'package:intl/intl.dart';

covidData covid = covidData();
String thaidate = covid.update_date;
String formattedDate = convertDate(thaidate);

String convertDate(String thaidate) {
  List<String> thaiMonths = [
    "มกราคม",
    "กุมพาพันธ์",
    "มีนาคม",
    "เมษายน",
    "พฤษภาคม",
    "มิถุนายน",
    "กรกฎาคม",
    "สิงหาคม",
    "กันยายน",
    "ตุลาคม",
    "พฤศจิกายน",
    "ธันวาคม"
  ];
  DateTime dateTime = DateTime.parse(thaidate);
  int buddhistYear = dateTime.year + 543;
  String formattedDate =
      '${dateTime.day} ${thaiMonths[dateTime.month - 1]} $buddhistYear';
  return formattedDate;
}

class ShowDate extends StatelessWidget {
  final Color color;

  const ShowDate({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: covid.getData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        Future.delayed(const Duration(seconds: 10));
        if (snapshot.connectionState != ConnectionState.done) {
          return const LinearProgressIndicator();
        }
        if (snapshot.hasData ||
            snapshot.connectionState == ConnectionState.done) {
          return Container(
            width: 330,
            height: 60, 
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
                child: Text(
              formattedDate,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            )),
          );
        } else if (snapshot.hasError) {
          return const Text('Error loading data');
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
