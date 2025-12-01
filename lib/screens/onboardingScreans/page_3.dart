import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 100,
            left: 20,
            child: Column(
              children: [Text('Built for \nTeachers').bold().wight().size(30)],
            ),
          ),
          Positioned(
            top: 10,
            left: 50,
            bottom: 10,
            child: Image.asset(width: 200, 'assets/images/p3.png'),
          ),
          Positioned(
            bottom: 180,
            left: 20,
            child: Text(
              'Edit profiles, manage timetables, \nand handle your class with \nease—everything designed \nfor teachers.',
            ).size(18).blue().onBoardingBText().bold(),
          ),
        ],
      ),
    );
  }
}
