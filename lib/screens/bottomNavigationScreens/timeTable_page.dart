import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/screens/timeTableTopBarPages/bach_daily_timeTable.dart';
import 'package:edu_trak/screens/timeTableTopBarPages/bach_weekly_timeTable.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  String selectedButton = 'Today';

  List<String> subjects = ['Flutter', 'Java', 'Python', 'AI'];
  String selectedSubject = 'Flutter';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.boubleBig,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedSubject,
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.backgroundw,
              ),
              items: subjects.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item).bold().size(18),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubject = value!;
                });
              },
            ),
          ),
        ),

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
    );
  }
}
