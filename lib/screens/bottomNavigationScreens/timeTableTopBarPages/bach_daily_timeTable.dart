import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BachDailyTimetable extends StatelessWidget {
  const BachDailyTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.custom(
        childrenDelegate: SliverChildListDelegate([
          AppCard(
            hight: 70,
            width: 300,
            border: Border.all(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20),
                Text('I st').size(20).bold(),
                SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Maths').size(20).semiBold(),
                    Text('Jone sir').semiBold(),
                  ],
                ),
                SizedBox(width: 50),
                Text('10:00am').semiBold(),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 10),
          AppCard(
            hight: 70,
            width: 300,
            border: Border.all(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20),
                Text('II nd').size(20).bold(),
                SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Science').size(20).semiBold(),
                    Text('Ameer sir').semiBold(),
                  ],
                ),
                SizedBox(width: 50),
                Text('11:00am').semiBold(),
                SizedBox(width: 20),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
