import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widget/componant/box.dart';

covidData covid = covidData();

class TotalCase extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const TotalCase({
    super.key,
    required this.width,
    required this.height,
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
            padding: const EdgeInsets.all(15.0),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(0),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "ป่วยสะสม",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  const Text(
                    "ตั้งเเต่ 1 มกราคม 2565",
                    style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                        color: Colors.white),
                  ),
                  Text(
                    "${covid.total_case}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
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
