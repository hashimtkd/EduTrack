import 'package:edu_trak/screens/auth_screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

import '../../components/app_button.dart';
import '../../components/app_text_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool added = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text('Create an account').size(32).blue().semiBold(),
                const SizedBox(height: 100),
                AppTextField(
                  text: Text('Email or phone number').size(14).black(),
                  validation: 'Enter email or phone number',
                  controller: emailController,
                  autoFill: (value) {
                    if (!added && emailController.text.contains('@')) {
                      emailController.text = '${emailController.text}gmail.com';
                      added = true;
                    }
                  },
                ),
                const SizedBox(height: 10),
                AppTextField(
                  passwordfeild: true,
                  text: Text('New password').size(14).black(),
                  validation: 'Enter new password',
                  controller: passController,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  passwordfeild: true,
                  text: Text('Confirm Password').size(14).black(),
                  validation: 'Confirm your password',
                  controller: confirmController,
                ),
                const SizedBox(height: 20),
                AppButton(
                  color: AppColors.backGround,
                  hight: 0.150,
                  width: 0.72,
                  child: Text('Save').size(16).semiBold().wight().wight(),
                  onTap: () async {
                    if (!_formKey.currentState!.validate()) return;

                    if (passController.text != confirmController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords do not match")),
                      );
                      return;
                    }

                    final msg = await context.read<UserProvider>().signUp(
                      emailController.text.trim(),
                      passController.text.trim(),
                    );

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(msg)));

                    if (msg == "Success") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    }
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
