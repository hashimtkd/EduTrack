import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/attendance_page.dart';

import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BachListOfAttendance extends StatefulWidget {
  final GestureTapCallback? onTap;
  const BachListOfAttendance({super.key, this.onTap});

  @override
  State<BachListOfAttendance> createState() => _BachListOfAttendanceState();
}

class _BachListOfAttendanceState extends State<BachListOfAttendance> {
  List bachList = ['Flutter', 'Mern Stack', 'Java', 'Java Script'];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => AppCard(
        color: AppColors.backgroundw,
        child: Text(bachList[index]).semiBold().blue().size(20),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AttendancePage();
              },
            ),
          );
        },
      ),

      itemCount: bachList.length,
    );
  }
}
