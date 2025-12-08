import 'package:edu_trak/components/app_alert_popup.dart';
import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/components/app_popup.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/screens/student_screens/student_profile_page.dart';

import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  final VoidCallback? onBack;
  const AttendancePage({super.key, this.onBack});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isClicked = false;
  String? status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Flutter').size(32).blue().bold(),
                Text('Total students : 44').size(24).blue().semiBold(),
                Text('25-11-2025 / Tuesday').size(14).blue().semiBold(),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.custom(
              childrenDelegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppCard(
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
                          onTap: () {},
                          width: 0.10,
                          hight: 0.15,
                          child: Text('Ok').bold().blue(),
                        ),
                      ],
                    ),

                    onTap: () {
                      Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const StudentProfilePage();
                              },
                            ),
                          )
                          .then((_) {
                            setState(() {});
                          });
                    },

                    color: AppColors.backGround,
                    hight: 50,
                    width: 300,

                    child: Row(
                      children: [
                        const SizedBox(width: 20),

                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            'assets/images/OIP (2).webp',
                          ),
                        ),

                        const SizedBox(width: 20),
                        Text('Muhammad Hashim').wight(),
                        const SizedBox(width: 20),

                        _isClicked
                            ? (status == 'Present'
                                  ? Text(status!).green().bold()
                                  : Text(status!).red().bold())
                            : Row(
                                children: [
                                  AppButton(
                                    border: Border.all(
                                      color: AppColors.backgroundw,
                                    ),
                                    onTap: () {
                                      status = 'Present';
                                      _isClicked = true;
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
                                            text: const Text('Type reason'),
                                            validation: 'Please type reason',
                                          ),
                                        ),

                                        [
                                          AppButton(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                status = 'Absent';
                                                _isClicked = true;
                                                setState(() {});
                                                widget.onBack
                                                    ?.call(); // instead of Navigator.pop
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
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
