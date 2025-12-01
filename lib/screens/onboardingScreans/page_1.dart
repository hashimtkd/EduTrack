import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 100,
            left: 20,
            child: Column(
              children: [
                Text('Manage Students \nEffortlessly').bold().wight().size(30),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            bottom: 10,
            child: Image.asset(width: 300, 'assets/images/p1.png'),
          ),
          Positioned(
            bottom: 180,
            left: 20,
            child: Text(
              'Keep all your student records \norganized in one place — attendance, profiles,\nand admissions.',
            ).size(18).blue().semiBold().onBoardingBText(),
          ),
        ],
      ),
    );
  }
}
