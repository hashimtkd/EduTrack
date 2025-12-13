import 'package:edu_trak/components/app_alert_popup.dart';
import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/components/app_popup.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/models/attendance_status_model.dart';
import 'package:edu_trak/providers/attendance_provider.dart';
import 'package:edu_trak/providers/student_provider.dart';
import 'package:edu_trak/screens/student_screens/new_admission_page.dart';
import 'package:edu_trak/screens/student_screens/student_profile_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendancePage extends StatefulWidget {
  final int batchId;
  final String batchName;

  const AttendancePage({
    super.key,
    required this.batchId,
    required this.batchName,
  });

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: [
              Text(widget.batchName).size(32).blue().bold(),
              Consumer<StudentProvider>(
                builder: (context, provider, _) {
                  final batchStudents = provider.studentModelList
                      .where((s) => s.bachId == widget.batchId)
                      .toList();

                  return Text(
                    'Total students : ${batchStudents.length}',
                  ).size(24).blue().semiBold();
                },
              ),
              Text(
                '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
              ).size(14).blue().semiBold(),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Consumer2<StudentProvider, AttendanceProvider>(
              builder: (context, studentPro, attendancePro, child) {
                final batchStudents = studentPro.studentModelList
                    .where((std) => std.bachId == widget.batchId)
                    .toList();

                return ListView.builder(
                  itemCount: batchStudents.length,
                  itemBuilder: (context, index) {
                    final student = batchStudents[index];

                    final currentStatus = attendancePro.attendanceModelList
                        .firstWhere(
                          (att) =>
                              att.studentId == student.id &&
                              att.date.day == DateTime.now().day &&
                              att.date.month == DateTime.now().month &&
                              att.date.year == DateTime.now().year,
                          orElse: () => AttendanceStatusModel(
                            status: "",
                            date: DateTime.now(),
                            studentId: student.id!,
                          ),
                        );

                    final status = currentStatus.status;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppCard(
                        color: AppColors.backGround,
                        hight: 100,
                        width: 300,
                        onLongPress: () => appAlertPopup(
                          context: context,
                          content: Text('Do you want to delete this profile?'),
                          action: [
                            AppButton(
                              onTap: () => Navigator.pop(context),
                              width: 0.20,
                              hight: 0.15,
                              child: Text('Cancel').blue().bold(),
                            ),
                            AppButton(
                              onTap: () {
                                if (student.id != null) {
                                  studentPro
                                      .delete(student.id!)
                                      .then((_) => Navigator.pop(context));
                                }
                              },
                              width: 0.10,
                              hight: 0.15,
                              child: Text('Ok').bold().blue(),
                            ),
                          ],
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StudentProfilePage(index: index),
                            ),
                          ).then((_) => setState(() {}));
                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 2),
                            Text(student.fullName).wight(),
                            const SizedBox(width: 20),

                            if (status.isNotEmpty)
                              Text(
                                status,
                                style: TextStyle(
                                  color: status == 'Absent'
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              )
                            else
                              Row(
                                children: [
                                  AppButton(
                                    border: Border.all(
                                      color: AppColors.backgroundw,
                                    ),
                                    onTap: () async {
                                      attendancePro.insert(
                                        AttendanceStatusModel(
                                          status: 'Present',
                                          date: DateTime.now(),
                                          studentId: student.id!,
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    width: 0.10,
                                    hight: 0.10,
                                    child: Text('P').green().bold(),
                                  ),

                                  const SizedBox(width: 10),

                                  AppButton(
                                    border: Border.all(
                                      color: AppColors.backgroundw,
                                    ),
                                    onTap: () {
                                      appPopup(
                                        context,
                                        Text('Reason').bold().blue(),
                                        Form(
                                          key: _formKey,
                                          child: AppTextField(
                                            controller: reasonController,
                                            text: const Text('Type reason'),
                                            validation: 'Please type reason',
                                          ),
                                        ),
                                        [
                                          AppButton(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                attendancePro.insert(
                                                  AttendanceStatusModel(
                                                    status: 'Absent',
                                                    date: DateTime.now(),
                                                    studentId: student.id!,
                                                    reason:
                                                        reasonController.text,
                                                  ),
                                                );
                                                Navigator.pop(context);
                                                setState(() {});
                                              }
                                            },
                                            width: 0.20,
                                            hight: 0.10,
                                            child: Text('Ok').wight().bold(),
                                          ),
                                        ],
                                      );
                                    },
                                    width: 0.10,
                                    hight: 0.10,
                                    child: Text('A').red().bold(),
                                  ),
                                ],
                              ),
                            const SizedBox(width: 2),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: AppColors.backgroundw),
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.backGround,
          foregroundColor: AppColors.backgroundw,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NewAdmissionPage()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
