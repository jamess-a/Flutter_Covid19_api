import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final double width;
  final double height;
  final String title;

  const Box({
    super.key, 
    required this.title, 
    required this.height, 
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Center(
        child: Text(
          title,
        ),
      ),
    );
  }
}
