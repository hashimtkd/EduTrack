import 'dart:io';
import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_popup.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/models/profile_image_model/profile_image_model.dart';
import 'package:edu_trak/models/teacher_model/teacher_model.dart';
import 'package:edu_trak/providers/profile_image_provider.dart';
import 'package:edu_trak/providers/teacher_provider.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/you_page.dart';
import 'package:edu_trak/screens/home_screen/home_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:edu_trak/utils/image_picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherRegisterPanel extends StatefulWidget {
  const TeacherRegisterPanel({super.key});

  @override
  State<TeacherRegisterPanel> createState() => _TeacherRegisterPanelState();
}

class _TeacherRegisterPanelState extends State<TeacherRegisterPanel> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool added = false;
  final _formKey = GlobalKey<FormState>();
  int? imgId;
  String? temporalyImage;

  Future<void> save() async {
    if (temporalyImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select profile image')));
      return;
    }

    final image = ProfileImageModel(profileImage: temporalyImage!);
    final imgId = await context.read<ProfileImageProvider>().insert(image);

    if (nameController.text.isNotEmpty &&
        qualificationController.text.isNotEmpty &&
        contactNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        imgId != null) {
      final teacher = TeacherModel(
        name: nameController.text.firstLetterUppercase(),
        contactNumber: contactNumberController.text,
        email: emailController.text,
        qualification: qualificationController.text,
        profileImageId: imgId,
      );

      await context.read<TeacherProvider>().insert(teacher);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          ),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Teacher Profile').size(32).blue().semiBold(),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,

        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: temporalyImage != null
                            ? FileImage(File(temporalyImage.toString()))
                            : null,
                        child: temporalyImage == null
                            ? Icon(Icons.person)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () async {
                            appPopup(
                              context,
                              Text('Upload from').blue(),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppButton(
                                    border: Border.all(
                                      color: AppColors.backGround,
                                    ),
                                    onTap: () async {
                                      final String? file =
                                          await ImagePickerHelper.pickFromCamera();
                                      if (file == null) return;
                                      setState(() {
                                        temporalyImage = file;
                                      });

                                      Navigator.of(context).pop();
                                    },
                                    width: 0.50,
                                    hight: 0.100,
                                    child: Text('Camera').blue().bold(),
                                  ),
                                  const SizedBox(height: 5),
                                  AppButton(
                                    border: Border.all(
                                      color: AppColors.backGround,
                                    ),
                                    onTap: () async {
                                      final file =
                                          await ImagePickerHelper.pickFromGallery();
                                      if (file == null) return;
                                      setState(() {
                                        temporalyImage = file;
                                      });

                                      Navigator.of(context).pop();
                                    },
                                    width: 0.50,
                                    hight: 0.100,
                                    child: Text('Gallery').blue().bold(),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: AppColors.backgroundw,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  AppTextField(
                    controller: nameController,
                    text: Text('Full name').size(14).black(),
                    validation: 'Enter first name',
                  ),

                  SizedBox(height: 10),

                  AppTextField(
                    controller: qualificationController,
                    text: Text('Qualification').size(14).black(),
                    validation: 'Enter qualification',
                  ),
                  SizedBox(height: 10),
                  AppTextField(
                    controller: contactNumberController,
                    text: Text('Contact number').size(14).black(),
                    validation: 'Enter contact number',
                    inputType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  AppTextField(
                    text: Text('Email').size(14).black(),
                    validation: 'Enter email',
                    inputType: TextInputType.emailAddress,
                    controller: emailController,
                    autoFill: (value) {
                      if (added == false &&
                          emailController.text.contains('@')) {
                        emailController.text =
                            '${emailController.text}gmail.com';
                        added = true;
                      }
                    },
                  ),

                  SizedBox(height: 20),
                  AppButton(
                    color: AppColors.backGround,
                    hight: 0.150,
                    width: 0.920,
                    child: Text('Save').size(16).semiBold().wight().wight(),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await save();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return YouPage();
                            },
                          ),
                        );
                        print('validate');
                      }
                      print('not valid');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
