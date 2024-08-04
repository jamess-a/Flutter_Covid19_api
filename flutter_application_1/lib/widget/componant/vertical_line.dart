import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Veti extends StatelessWidget {
  const Veti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 2,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
