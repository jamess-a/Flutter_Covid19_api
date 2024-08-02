import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String head;
  final BorderRadiusGeometry borderRadius;
  final Color color;

  const Box({
    super.key,
    required this.head,
    required this.title,
    required this.height,
    required this.width,
    required this.borderRadius, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
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
            Text(head),
            Text(title),
          ],
        ),
      ),
    );
  }
}
