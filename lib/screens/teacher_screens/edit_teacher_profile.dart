import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/screens/home_screen/home_page.dart';
import 'package:edu_trak/utils/app_colors.dart';

import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class EditTeacherProfile extends StatefulWidget {
  const EditTeacherProfile({super.key});

  @override
  State<EditTeacherProfile> createState() => _EditTeacherProfileState();
}

class _EditTeacherProfileState extends State<EditTeacherProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool added = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,

      body: SizedBox(
        height: size.height,
        width: size.width,

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Text('Edit your profile').size(32).blue().semiBold(),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/OIP (2).webp'),
                child: Container(
                  alignment: Alignment(1, 1),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo, color: AppColors.backgroundw),
                  ),
                ),
              ),
              SizedBox(height: 10),
              AppTextField(
                text: Text('First name').size(14).black(),
                validation: 'Enter first name',
              ),
              SizedBox(height: 10),
              AppTextField(
                text: Text('Second name').size(14).black(),
                validation: 'Enter second name',
              ),
              SizedBox(height: 10),
              AppTextField(
                text: Text('Subject').size(14).black(),
                validation: 'Enter subject',
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
                  if (added == false && emailController.text.contains('@')) {
                    emailController.text = '${emailController.text}gmail.com';
                    added = true;
                  }
                },
              ),

              SizedBox(height: 20),
              AppButton(
                color: AppColors.backGround,
                hight: 0.150,
                width: 0.72,
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
    );
  }
}
