import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_text_field.dart';

import 'package:edu_trak/screens/home_screen/home_page.dart';
import 'package:edu_trak/utils/app_colors.dart';

import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TeacherRegisterPanel extends StatefulWidget {
  const TeacherRegisterPanel({super.key});

  @override
  State<TeacherRegisterPanel> createState() => _TeacherRegisterPanelState();
}

class _TeacherRegisterPanelState extends State<TeacherRegisterPanel> {
  final TextEditingController emailController = TextEditingController();
  bool added = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/OIP (2).webp'),
                    child: Container(
                      alignment: Alignment(1, 1),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo,
                          color: AppColors.backgroundw,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  AppTextField(
                    text: Text('Full name').size(14).black(),
                    validation: 'Enter first name',
                  ),

                  SizedBox(height: 10),

                  AppTextField(
                    text: Text('Qualification').size(14).black(),
                    validation: 'Enter qualification',
                  ),
                  SizedBox(height: 10),
                  AppTextField(
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
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomePage();
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
