import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widget/componant/box.dart';

covidData covid = covidData();

class NewRecovered extends StatelessWidget {
  final double width;
  final double height;
  final String head;
  final BorderRadiusGeometry borderRadius;
  final Color color;

  const NewRecovered(
      {super.key,
      required this.width,
      required this.height,
      required this.head,
      required this.borderRadius,
      required this.color});

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
          return Box(
            head: head,
            title: covid.new_recovered.toString(),
            width: width,
            height: height,
            borderRadius: borderRadius,
            color: color,
          );
        } else if (snapshot.hasError) {
          return const Box(
            head: "Error",
            title: "Error fetching data",
            width: 200,
            height: 150,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.red,
          );
        } else {
          return const Box(
            head: "Error",
            title: "No data",
            width: 200,
            height: 150,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.red,
          );
        }
      },
    );
  }
}
