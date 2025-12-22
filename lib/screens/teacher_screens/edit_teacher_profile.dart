import 'dart:io';
import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_popup.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/models/profile_image_model/profile_image_model.dart';
import 'package:edu_trak/models/teacher_model/teacher_model.dart';
import 'package:edu_trak/providers/profile_image_provider.dart';
import 'package:edu_trak/providers/teacher_provider.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/you_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:edu_trak/utils/image_picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTeacherProfile extends StatefulWidget {
  final String? profileImage;
  final int? profileImageId;
  final TeacherModel teacher;
  const EditTeacherProfile({
    super.key,
    required this.profileImage,
    this.profileImageId,
    required this.teacher,
  });

  @override
  State<EditTeacherProfile> createState() => _EditTeacherProfileState();
}

class _EditTeacherProfileState extends State<EditTeacherProfile> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool added = false;
  final _formKey = GlobalKey<FormState>();

  String? temporalyImage;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.teacher.name;
    qualificationController.text = widget.teacher.qualification;
    contactNumberController.text = widget.teacher.contactNumber;
    emailController.text = widget.teacher.email;
  }

  Future<void> edit() async {
    int? newImageId = widget.profileImageId;

    if (temporalyImage != null && temporalyImage!.isNotEmpty) {
      final image = ProfileImageModel(profileImage: temporalyImage!);
      newImageId = await context.read<ProfileImageProvider>().insert(image);
    }

    if (nameController.text.isNotEmpty &&
        qualificationController.text.isNotEmpty &&
        contactNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      final teacher = TeacherModel(
        id: widget.teacher.id,
        name: nameController.text.firstLetterUppercase(),
        contactNumber: contactNumberController.text,
        email: emailController.text,
        qualification: qualificationController.text,
        profileImageId: newImageId,
        profileImagepath: temporalyImage ?? widget.profileImage,
      );

      await context.read<TeacherProvider>().update(teacher);

      if (temporalyImage != null &&
          temporalyImage!.isNotEmpty &&
          widget.profileImage != null &&
          widget.profileImageId != null) {
        await context.read<ProfileImageProvider>().delete(
          widget.profileImage!,
          widget.profileImageId,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Edit Profile').size(32).blue().semiBold(),
        centerTitle: true,
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
                        backgroundImage:
                            temporalyImage != null && temporalyImage!.isNotEmpty
                            ? FileImage(File(temporalyImage!))
                            : widget.profileImage != null &&
                                  widget.profileImage!.isNotEmpty
                            ? FileImage(File(widget.profileImage!))
                            : null,

                        child:
                            (temporalyImage == null ||
                                    temporalyImage!.isEmpty) &&
                                (widget.profileImage == null ||
                                    widget.profileImage!.isEmpty)
                            ? const Icon(Icons.person, size: 40)
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
                                      final file =
                                          await ImagePickerHelper.pickFromCamera();

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
                        await edit();
                        await Navigator.of(context).pushReplacement(
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
