import 'dart:io';

import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/providers/profile_image_provider.dart';
import 'package:edu_trak/providers/teacher_provider.dart';
import 'package:edu_trak/screens/teacher_screens/edit_teacher_profile.dart';
import 'package:edu_trak/screens/teacher_screens/teacher_register_panel.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YouPage extends StatelessWidget {
  const YouPage({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherList = context.watch<TeacherProvider>().teacherModelList;

    if (teacherList == null || teacherList.isEmpty) {
      return const TeacherRegisterPanel();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: AppColors.backGround,

      body: Center(
        child: Consumer<TeacherProvider>(
          builder:
              (
                BuildContext context,
                TeacherProvider teacherProvider,
                Widget? child,
              ) {
                final teacher = teacherProvider.currentTeacher;
                final List imageList = context
                    .watch<ProfileImageProvider>()
                    .profileImageList
                    .where((img) => img.id == teacher!.profileImageId)
                    .toList();

                return Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: imageList.isNotEmpty
                          ? FileImage(File(imageList.first.profileImage))
                          : null,
                      child: imageList.isEmpty ? Icon(Icons.person) : null,
                    ),
                    SizedBox(height: 10),
                    Text(teacher!.name).wight().size(20),
                    SizedBox(height: 5),
                    Text(teacher.qualification).wight().size(20),
                    SizedBox(height: 5),
                    Text(teacher.contactNumber).wight().size(20),
                    SizedBox(height: 5),
                    Text(teacher.email).wight().size(20),
                    SizedBox(height: 10),
                    AppButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EditTeacherProfile(
                                teacher: teacher,
                                profileImage: imageList.isNotEmpty
                                    ? imageList.first.profileImage
                                    : null,
                                profileImageId: imageList.isNotEmpty
                                    ? imageList.first.id
                                    : null,
                              );
                            },
                          ),
                        );
                      },
                      border: Border.all(color: AppColors.backgroundw),
                      width: 0.350,
                      hight: 0.10,
                      child: Text('Edit Profile').wight().bold(),
                    ),
                  ],
                );
              },
        ),
      ),
    );
  }
}
