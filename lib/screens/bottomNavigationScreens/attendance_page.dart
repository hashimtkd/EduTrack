import 'package:edu_trak/screens/bottomNavigationScreens/bach_attendance_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/bach_list.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool showStudentAttendance = false;

  @override
  Widget build(BuildContext context) {
    return showStudentAttendance
        ? BachAttendancePage(
            onBack: () {
              setState(() {
                showStudentAttendance = false;
              });
            },
          )
        : BachList(
            onTap: () {
              setState(() {
                showStudentAttendance = true;
              });
            },
          );
  }
}
