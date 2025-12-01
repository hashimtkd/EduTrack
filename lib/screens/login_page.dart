import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/screens/app_bach_home_page.dart';
import 'package:edu_trak/screens/home_page.dart';
import 'package:edu_trak/screens/reset_password_page.dart';
import 'package:edu_trak/screens/teacher_register_panel.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
                SizedBox(height: 100),
                Text('Login').size(32).blue().semiBold(),
                SizedBox(height: 100),
                AppTextField(
                  text: Text('Username').size(14).black(),
                  validation: 'Enter username',
                ),
                SizedBox(height: 10),
                AppTextField(
                  text: Text('Password').size(14).black(),
                  validation: 'Enter password',
                ),

                SizedBox(height: 20),
                AppButton(
                  color: AppColors.backGround,
                  hight: 0.150,
                  width: 0.72,
                  child: Text('Login').size(16).semiBold().wight().wight(),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return AppBachHomePage();
                          },
                        ),
                      );
                      print('validate');
                    }
                    print('not valid');
                  },
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ResetPasswordPage();
                          },
                        ),
                      ),
                      child: Text('Forgot Password?').size(14).blue(),
                    ),
                    SizedBox(width: 52),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account?').black().size(12),
                    SizedBox(width: 2),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return TeacherRegisterPanel();
                          },
                        ),
                      ),
                      child: Text('Register now').blue().size(12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
