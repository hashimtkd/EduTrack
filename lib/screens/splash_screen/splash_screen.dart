import 'dart:async';

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
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return OnboardingScrean();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text('EduTrack').size(40).wight().splashScreanText(),
        ),
      ),
    );
  }
}
