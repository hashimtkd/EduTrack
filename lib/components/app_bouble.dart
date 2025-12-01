import 'package:flutter/material.dart';

class AppBouble extends StatelessWidget {
  final double hight;
  final double width;
  final Color color;
  const AppBouble({
    super.key,
    required this.hight,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      height: size.width * hight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(200)),
        color: color,
      ),
    );
  }
}
