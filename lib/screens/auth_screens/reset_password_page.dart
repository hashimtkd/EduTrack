import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/screens/auth_screens/login_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool added = false;
  final _formKey = GlobalKey<FormState>();

  void resetPassword() async {
    if (_formKey.currentState!.validate()) {
      final id = idController.text.trim();
      final newPass = newPassController.text.trim();
      final confirmPass = confirmPassController.text.trim();

      if (newPass != confirmPass) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
        return;
      }

      final box = context.read<UserProvider>();

      bool userExists = box.login(id, newPass);
      if (!userExists) {
        final allUsers = box.userList();
        if (!allUsers.contains(id)) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("User not found")));
          return;
        }
      }

      await box.updatePassword(id, newPass);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password updated successfully")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

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
                const SizedBox(height: 100),
                Text('Reset password').size(32).blue().semiBold(),
                const SizedBox(height: 100),

                AppTextField(
                  text: const Text('Email or phone number').size(14).black(),
                  validation: 'Enter email or phone number',
                  controller: idController,
                  autoFill: (value) {
                    if (!added && idController.text.contains('@')) {
                      idController.text = '${idController.text}gmail.com';
                      added = true;
                    }
                  },
                ),
                const SizedBox(height: 10),
                AppTextField(
                  passwordfeild: true,
                  text: const Text('New password').size(14).black(),
                  validation: 'Enter new password',
                  controller: newPassController,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  passwordfeild: true,
                  text: const Text('Confirm new password').size(14).black(),
                  validation: 'Please confirm new password',
                  controller: confirmPassController,
                ),
                const SizedBox(height: 20),
                AppButton(
                  color: AppColors.backGround,
                  hight: 0.150,
                  width: 0.72,
                  onTap: resetPassword,
                  child: const Text('Save').size(16).semiBold().wight().wight(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
