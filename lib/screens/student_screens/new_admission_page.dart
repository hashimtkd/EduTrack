import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/screens/home_page.dart';
import 'package:edu_trak/utils/app_colors.dart';

import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class NewAdmissionPage extends StatefulWidget {
  const NewAdmissionPage({super.key});

  @override
  State<NewAdmissionPage> createState() => _NewAdmissionPageState();
}

class _NewAdmissionPageState extends State<NewAdmissionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool added = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,

        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 50),
                Text('New Admission').size(32).blue().semiBold(),
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/OIP (2).webp'),
                  child: Container(
                    alignment: Alignment(1.3, 1.7),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: AppColors.backgroundw,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                AppTextField(
                  text: Text('Full name').size(14).black(),
                  validation: 'Enter full name',
                ),
                SizedBox(height: 10),
                AppTextField(
                  text: Text('Date Of Birth').size(14).black(),
                  validation: 'Enter bate of birth',
                  inputType: TextInputType.datetime,
                ),
                SizedBox(height: 10),
                AppTextField(
                  text: Text('Guardian').size(14).black(),
                  validation: 'Enter guardian name',
                ),

                SizedBox(height: 10),
                AppTextField(
                  text: Text('Blood group').size(14).black(),
                  validation: 'Select blood group',
                ),
                SizedBox(height: 10),
                AppTextField(
                  text: Text('Contact number').size(14).black(),
                  validation: 'Enter contact number',
                  inputType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                AppTextField(
                  text: Text('Address').size(14).black(),
                  validation: 'Enter address',
                ),

                SizedBox(height: 10),
                AppTextField(
                  text: Text('Bach').size(14).black(),
                  validation: 'Enter bach',
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
      ),
    );
  }
}
