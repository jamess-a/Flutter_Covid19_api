import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widget/componant/box.dart';
import 'package:flutter_application_1/widget/componant/vertical_line.dart';


covidData covid = covidData();

class NewCase extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const NewCase(
      {super.key,
      required this.width,
      required this.height,
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
                    "จำนวนผู้ป่วยใหม่วันนี้",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white),
                  ),
                  Text(
                    "+${covid.new_case}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            const Text(
                              "ผู้ป่วยในประเทศ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                  color: Colors.white),
                            ),
                            Text(
                              "${covid.total_case}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Veti(),
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            const Text(
                              "ผู้ป่วยจากต่างประเทศ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                  color: Colors.white),
                            ),
                            Text(
                              "+${covid.new_case_excludeabroad}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
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
