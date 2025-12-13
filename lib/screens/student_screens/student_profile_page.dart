import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/models/attendance_status_model.dart';
import 'package:edu_trak/providers/attendance_provider.dart';

import 'package:edu_trak/providers/student_provider.dart';
import 'package:edu_trak/screens/student_screens/edit_student_profile_page.dart';

import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentProfilePage extends StatefulWidget {
  final int index;
  const StudentProfilePage({super.key, required this.index});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.backGround),
      backgroundColor: AppColors.backGround,
      body: Center(
        child: Consumer<StudentProvider>(
          builder: (context, provider, child) {
            final student = provider.studentModelList[widget.index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(student.fullName).wight().size(30).bold(),
                Column(children: [Text(student.address[0]).wight().size(25)]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(student.bloodGroup).red(),
                    Icon(Icons.water_drop, color: Colors.red, size: 14),
                  ],
                ),

                Text(student.contactNumber).green(),
                Text(student.email).wight(),
                SizedBox(height: 10),
                AppButton(
                  hight: 0.100,
                  width: 0.700,
                  border: Border.all(color: AppColors.backgroundw),
                  child: Text('Edit').wight().size(16).semiBold(),
                  onTap: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EditStudentPage(
                              id: student.id,
                              index: widget.index,
                              provider: student,
                            );
                          },
                        ),
                      )
                      .then((_) {
                        setState(() {});
                      }),
                ),
                SizedBox(height: 20),
                AppCard(
                  width: size.width * 0.700,

                  color: AppColors.backgroundw,
                  child: Column(
                    children: [
                      Text('Today').blue().bold().size(16),

                      Consumer<AttendanceProvider>(
                        builder:
                            (
                              BuildContext context,
                              AttendanceProvider attendancePro,
                              Widget? child,
                            ) {
                              final currentStatus = attendancePro
                                  .attendanceModelList
                                  .firstWhere(
                                    (att) =>
                                        att.studentId == student.id &&
                                        att.date.day == DateTime.now().day &&
                                        att.date.month ==
                                            DateTime.now().month &&
                                        att.date.year == DateTime.now().year,
                                    orElse: () => AttendanceStatusModel(
                                      status: "-",
                                      date: DateTime.now(),
                                      studentId: student.id!,
                                    ),
                                  );

                              final status = currentStatus.status;
                              return Text(
                                status,
                                style: TextStyle(
                                  color: status == 'Absent'
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ).green();
                            },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                AppCard(
                  width: size.width * 0.700,
                  hight: size.height * 0.100,
                  color: AppColors.backgroundw,
                  child: Column(
                    children: [
                      Text('November').blue().bold().size(16),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total attendance :').blue(),
                          Text('25').green(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total absentees  :').blue(),
                          Text('2').red(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                AppCard(
                  width: size.width * 0.700,
                  hight: size.height * 0.100,
                  color: AppColors.backgroundw,
                  child: Column(
                    children: [
                      Text('2025-2026').blue().bold().size(16),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total attendance :').blue(),
                          Text('25').green(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total absentees  :').blue(),
                          Text('2').red(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
