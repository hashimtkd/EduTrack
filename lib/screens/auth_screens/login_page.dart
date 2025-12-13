import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/db/db_functions/shared_preferences/login_prefs.dart';
import 'package:edu_trak/screens/auth_screens/create_account_page.dart';
import 'package:edu_trak/screens/home_screen/home_page.dart';
import 'package:edu_trak/screens/auth_screens/reset_password_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController idController = TextEditingController();
  final TextEditingController passController = TextEditingController();

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
                const SizedBox(height: 100),
                Text('Login').size(32).blue().semiBold(),
                const SizedBox(height: 100),

                AppTextField(
                  text: Text('Username').size(14).black(),
                  controller: idController,
                  validation: 'Enter username',
                ),

                const SizedBox(height: 10),

                AppTextField(
                  passwordfeild: true,
                  text: Text('Password').size(14).black(),
                  controller: passController,
                  validation: 'Enter password',
                ),

                const SizedBox(height: 20),

                AppButton(
                  color: AppColors.backGround,
                  hight: 0.150,
                  width: 0.72,
                  child: Text('Login').size(16).semiBold().wight().wight(),
                  onTap: () async {
                    if (!_formKey.currentState!.validate()) return;

                    final success = context.read<UserProvider>().login(
                      idController.text.trim(),
                      passController.text.trim(),
                    );

                    if (success) {
                      await LoginPrefs.setLogin(true);
                      await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid username or password"),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ResetPasswordPage(),
                        ),
                      ),
                      child: Text('Forgot Password?').size(14).blue(),
                    ),
                    const SizedBox(width: 52),
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account?').black().size(12),
                    const SizedBox(width: 2),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CreateAccount(),
                        ),
                      ),
                      child: Text('Create a account').blue().size(12),
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
