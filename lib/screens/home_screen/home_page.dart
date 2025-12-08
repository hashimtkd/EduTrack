import 'package:edu_trak/components/app_bouble.dart';

import 'package:edu_trak/screens/bottomNavigationScreens/bach_list_of_attendance.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/result_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/timeTable_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/you_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> pages(BuildContext context) {
    return [
      const BachListOfAttendance(),
      const TimetablePage(),
      const ResultPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,

      drawer: Drawer(
        backgroundColor: AppColors.backGround,
        child: const YouPage(),
      ),

      appBar: AppBar(backgroundColor: AppColors.backGround),

      body: Stack(
        children: [
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

          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.210,
              decoration: BoxDecoration(
                color: AppColors.backGround,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Text('Makbig').size(32).wight().bold(),
                  Text('Total students : 144').size(24).wight().semiBold(),
                  Text('25-11-2025 / Tuesday').size(14).wight().semiBold(),
                ],
              ),
            ),
          ),

          Positioned.fill(
            top: 200,
            child: IndexedStack(index: selectedIndex, children: pages(context)),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(size: 40),
        currentIndex: selectedIndex,

        onTap: (value) {
          if (value == 3) {
            _scaffoldKey.currentState!.openDrawer();
          } else {
            setState(() {
              selectedIndex = value;
            });
          }
        },

        backgroundColor: AppColors.backGround,
        items: [
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
    );
  }
}
