import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widget/componant/box.dart';

covidData covid = covidData();

class TotalNewRecovered extends StatelessWidget {
  const TotalNewRecovered ({super.key});

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
            title: covid.new_recovered.toString(),
            width: 200,
            height: 70,
          );
        } else if (snapshot.hasError) {
          return const Box(title: "Error fetching data", width: 200, height: 150);
        } else {
          return const Box(title: "No data" , width: 200, height: 150);
        }
      },
    );
  }
}
