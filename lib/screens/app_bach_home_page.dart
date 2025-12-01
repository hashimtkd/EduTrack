import 'package:edu_trak/components/app_bouble.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/attendance_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/bach_home_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/bach_result_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/bach_timeTable_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/you_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AppBachHomePage extends StatefulWidget {
  const AppBachHomePage({super.key});

  @override
  State<AppBachHomePage> createState() => _AppBachHomePageState();
}

class _AppBachHomePageState extends State<AppBachHomePage> {
  int selectedIndex = 0;

  List<Widget> pages(BuildContext context) {
    return [
      AppBachStudents(
        changeIndex: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      const AttendancePage(),
      const BachTimetablePage(),
      const BachResultPage(),
      const YouPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0; // Go Home
          });
          return false;
        }
        return true; // exit app
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.backGround),

        body: Stack(
          children: [
            // ---------------- Background -----------------
            Positioned(
              bottom: 150,
              left: 50,
              child: AppBouble(
                hight: 1.2,
                width: 1.2,
                color: AppColors.boubleSmall,
              ),
            ),
            Positioned(
              top: 150,
              right: 50,
              child: AppBouble(
                hight: 1.2,
                width: 1.2,
                color: AppColors.boubleSmall,
              ),
            ),
            Positioned(
              bottom: -20,
              right: 50,
              child: AppBouble(
                hight: 1.2,
                width: 1.2,
                color: AppColors.boubleMedium,
              ),
            ),

            // ---------- TOP CARD ----------
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.230,
                decoration: BoxDecoration(
                  color: AppColors.backGround,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Text('Flutter').size(32).wight().bold(),
                    Text('Total students : 44').size(24).wight().semiBold(),
                    Text('25-11-2025 / Tuesday').size(14).wight().semiBold(),
                  ],
                ),
              ),
            ),

            // -------- Main Content ---------
            Positioned.fill(
              top: 200,
              child: IndexedStack(
                index: selectedIndex,
                children: pages(context),
              ),
            ),
          ],
        ),

        // -------- Bottom Navigation ---------
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(size: 40),
          currentIndex: selectedIndex,

          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },

          backgroundColor: AppColors.backGround,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: AppColors.backgroundw),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed, color: AppColors.backgroundw),
              label: 'Attendance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note, color: AppColors.backgroundw),
              label: 'Time table',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ad_units, color: AppColors.backgroundw),
              label: 'Result',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: AppColors.backgroundw),
              label: 'You',
            ),
          ],
        ),
      ),
    );
  }
}
