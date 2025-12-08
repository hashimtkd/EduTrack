import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/screens/auth_screens/login_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  bool added = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,

      body: SizedBox(
        height: size.height,
        width: size.width,

        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 100),
                Text('Reset password').size(32).blue().semiBold(),
                SizedBox(height: 100),
                AppTextField(
                  text: Text('Email or phone number').size(14).black(),
                  validation: 'Enter email or phone number',
                  controller: emailController,
                  autoFill: (value) {
                    if (added == false && emailController.text.contains('@')) {
                      emailController.text = '${emailController.text}gmail.com';
                      added = true;
                    }
                  },
                ),
                SizedBox(height: 10),
                AppTextField(
                  text: Text('New password').size(14).black(),
                  validation: 'Enter new password',
                ),
                SizedBox(height: 10),
                AppTextField(
                  text: Text('Confirm new Password').size(14).black(),
                  validation: 'Please confirm new password',
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
                            return LoginPage();
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
