import 'package:edu_trak/db/db_functions/shared_preferences/login_prefs.dart';
import 'package:edu_trak/screens/auth_screens/login_page.dart';
import 'package:edu_trak/screens/auth_screens/reset_password_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:flutter/material.dart';

class YouPage extends StatelessWidget {
  const YouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 30),

          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: AppColors.backGround),
          ),

          const SizedBox(height: 15),

          const Text(
            "Jone sir",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          ListTile(
            leading: const Icon(Icons.lock, color: Colors.white),
            title: const Text(
              "Change Password",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ResetPasswordPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text("Logout", style: TextStyle(color: Colors.white)),
            onTap: () async {
              await LoginPrefs.logout();
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
