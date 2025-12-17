import 'dart:async';

import 'package:edu_trak/db/db_functions/shared_preferences/login_prefs.dart';
import 'package:edu_trak/screens/home_screen/home_page.dart';
import 'package:edu_trak/screens/onboardingScreans/onboarding_screen.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SplashScrean extends StatefulWidget {
  const SplashScrean({super.key});

  @override
  State<SplashScrean> createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    Future.delayed(const Duration(seconds: 3), () async {
      final status = await LoginPrefs.getLoginStatus();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              status == true ? const HomePage() : const OnboardingScrean(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: const Text('EduTrack').size(40).wight().splashScreanText(),
        ),
      ),
    );
  }
}
