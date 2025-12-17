import 'package:edu_trak/components/app_bouble.dart';
import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/db/db_functions/shared_preferences/login_prefs.dart';
import 'package:edu_trak/providers/student_provider.dart';
import 'package:edu_trak/screens/auth_screens/login_page.dart';
import 'package:edu_trak/screens/auth_screens/reset_password_page.dart';

import 'package:edu_trak/screens/bottomNavigationScreens/bach_list_of_attendance.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/result_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/timeTable_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/you_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_date.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool youPage = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> pages(BuildContext context) {
    return [
      const BachListOfAttendance(),
      const TimetablePage(),
      const ResultPage(),
      const YouPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,

      drawer: Drawer(
        backgroundColor: AppColors.backGround,
        child: Column(
          children: [
            const SizedBox(height: 100),

            AppCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return YouPage();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: AppColors.backGround,
                    ),
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
                ],
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
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
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

          youPage == false
              ? Positioned(
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
                    child: Consumer<StudentProvider>(
                      builder:
                          (
                            BuildContext context,
                            StudentProvider provider,
                            Widget? child,
                          ) {
                            return Column(
                              children: [
                                const Text(
                                  'Zubair Academy',
                                ).size(32).wight().bold(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Total students :').size(16).wight(),
                                    Text(
                                      '  ${provider.studentModelList.length}',
                                    ).size(16).wight().bold(),
                                  ],
                                ),
                                Text(
                                  AppDate.todayDate(),
                                ).size(16).wight().semiBold(),
                              ],
                            );
                          },
                    ),
                  ),
                )
              : Container(),

          Positioned.fill(
            top: youPage == false ? 200 : 0,
            child: IndexedStack(index: selectedIndex, children: pages(context)),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(size: 40),
        currentIndex: selectedIndex,

        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
          if (value == 3) {
            youPage = true;
          } else {
            youPage = false;
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
