import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/bach_home_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/timeTableTopBarPages/bach_daily_timeTable.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/timeTableTopBarPages/bach_weekly_timeTable.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BachTimetablePage extends StatefulWidget {
  const BachTimetablePage({super.key});

  @override
  State<BachTimetablePage> createState() => _BachTimetablePageState();
}

class _BachTimetablePageState extends State<BachTimetablePage> {
  List timeTableTopBarList = [BachDailyTimetable(), BachWeeklyTimetable()];
  String selectedButton = 'Today';

  @override
  Widget build(BuildContext context) {
    return yourBachList.isEmpty
        ? Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                'Your bach list is empty \nplease add your bachs',
              ).size(20).semiBold().blue().onBoardingBText(),
            ),
          )
        : Container(
            child: Column(
              children: [
                SizedBox(
                  height: 60,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppCard(
                        color: AppColors.boubleBig,
                        width: 150,
                        hight: 50,
                        border: Border.all(),
                        child: selectedButton == 'Today'
                            ? Text('Today').bold().size(28).black()
                            : Text('Today').bold().size(20).wight(),
                        onTap: () {
                          selectedButton = 'Today';
                          setState(() {});
                        },
                      ),
                      AppCard(
                        color: AppColors.boubleBig,
                        width: 150,
                        hight: 50,
                        border: Border.all(),
                        child: selectedButton == 'Week'
                            ? Text('Week').bold().size(28).black()
                            : Text('Week').bold().size(20).wight(),
                        onTap: () {
                          selectedButton = 'Week';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: selectedButton == 'Today'
                      ? BachDailyTimetable()
                      : BachWeeklyTimetable(),
                ),
              ],
            ),
          );
  }
}
