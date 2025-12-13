import 'package:edu_trak/components/app_bouble.dart';
import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/screens/auth_screens/login_page.dart';
import 'package:edu_trak/screens/onboardingScreans/page_1.dart';
import 'package:edu_trak/screens/onboardingScreans/page_2.dart';
import 'package:edu_trak/screens/onboardingScreans/page_3.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScrean extends StatefulWidget {
  const OnboardingScrean({super.key});

  @override
  State<OnboardingScrean> createState() => _OnboardingScreanState();
}

class _OnboardingScreanState extends State<OnboardingScrean> {
  List onboardingPageList = [Page1(), Page2(), Page3()];
  final controller = PageController();
  int currentPageIndex = 0;
  final bool isPage3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 50,
              child: AppBouble(
                hight: 1,
                width: 1,
                color: AppColors.boubleSmall,
              ),
            ),
            Positioned(
              top: 100,

              child: AppBouble(
                hight: 1.1,
                width: 1.1,
                color: AppColors.boubleMedium,
              ),
            ),
            Positioned(
              top: -80,
              right: 60,
              child: AppBouble(
                hight: 1.2,
                width: 1.2,
                color: AppColors.boubleBig,
              ),
            ),
            Positioned.fill(
              child: Container(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPageIndex = value;
                    });
                  },
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return onboardingPageList[index];
                  },
                  itemCount: onboardingPageList.length,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 50,
              child: SizedBox(
                width: 270,
                child: currentPageIndex == 2
                    ? AppButton(
                        color: AppColors.boubleBig,
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        width: 0.15,
                        hight: 0.14,
                        child: Text('Get start').wight().bold().size(20),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                            border: Border.all(color: AppColors.backGround),
                            width: 0.15,
                            hight: 0.10,
                            onTap: () {
                              controller.jumpToPage(3);
                            },
                            child: Text('Skip').blue().bold().size(15),
                          ),
                          SmoothPageIndicator(
                            effect: WormEffect(),
                            controller: controller,
                            count: onboardingPageList.length,
                          ),
                          AppButton(
                            border: Border.all(color: AppColors.backGround),
                            width: 0.15,
                            hight: 0.10,
                            onTap: () {
                              controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text('Next').blue().bold(),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
