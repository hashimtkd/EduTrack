import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
                Text('Quick & Smart\nAttendance').bold().wight().size(30),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            bottom: 10,
            child: Image.asset(width: 300, 'assets/images/p2.png'),
          ),
          Positioned(
            bottom: 180,
            left: 20,
            child: Text(
              'Mark daily attendance in seconds \nwith a clean and simple interface.',
            ).size(18).blue().onBoardingBText().bold(),
          ),
        ],
      ),
    );
  }
}
