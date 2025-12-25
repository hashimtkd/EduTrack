import 'dart:io';

import 'package:edu_trak/components/app_bouble.dart';
import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/db/db_functions/shared_preferences/login_prefs.dart';
import 'package:edu_trak/models/bach_model/bach_model.dart';
import 'package:edu_trak/models/profile_image_model/profile_image_model.dart';
import 'package:edu_trak/models/student_model/student_model.dart';
import 'package:edu_trak/models/teacher_model/teacher_model.dart';
import 'package:edu_trak/providers/bach_provider.dart';
import 'package:edu_trak/providers/profile_image_provider.dart';
import 'package:edu_trak/providers/student_provider.dart';
import 'package:edu_trak/providers/teacher_provider.dart';
import 'package:edu_trak/screens/auth_screens/login_page.dart';
import 'package:edu_trak/screens/auth_screens/reset_password_page.dart';

import 'package:edu_trak/screens/bottomNavigationScreens/bach_list_of_attendance.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/result_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/timeTable_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/you_page.dart';
import 'package:edu_trak/screens/student_screens/student_profile_page.dart';
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
  TextEditingController searchController = TextEditingController();
  bool isClickedSearchButton = false;
  List<Widget> pages(BuildContext context) {
    return [
      const BachListOfAttendance(),
      const TimetablePage(),
      const ResultPage(),
      const YouPage(),
    ];
  }

  List<StudentModel> studentList = [];
  Future<void> searchStudent(TextEditingController searchController) async {
    if (searchController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Search something.')));
      return;
    }
    setState(() {
      studentList = context
          .read<StudentProvider>()
          .studentModelList
          .where(
            (student) =>
                student.fullName.toLowerCase().contains(searchController.text),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TeacherModel? teacher = context
        .watch<TeacherProvider>()
        .currentTeacher;
    final imageList = context
        .watch<ProfileImageProvider>()
        .profileImageList
        .where((img) => img.id == teacher?.profileImageId)
        .toList();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        actionsPadding: EdgeInsets.only(right: 50),
        actions: [
          AppTextField(
            controller: searchController,
            higet: 35,
            width: 250,
            text: Text('Search student name'),
            suffixIcon: IconButton(
              onPressed: () async {
                setState(() {
                  isClickedSearchButton = !isClickedSearchButton;
                });
                await searchStudent(searchController);
              },
              icon: Icon(Icons.search, color: AppColors.backGround),
            ),
          ),
        ],
      ),

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
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: imageList.isNotEmpty
                        ? FileImage(File(imageList.first.profileImage))
                        : null,
                    child: imageList.isEmpty ? Icon(Icons.person) : null,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    teacher == null ? "Teacher" : teacher.name,

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
                                const SizedBox(height: 15),
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
          if (isClickedSearchButton == true) ...[
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    isClickedSearchButton = false;
                  });
                },
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: AppColors.backGround),
                    color: AppColors.backgroundw,
                  ),
                  height: 300,
                  width: 300,

                  child: ListView.builder(
                    itemCount: studentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final student = studentList[index];
                      final batchList = context.read<BachProvider>().bachtList;
                      final batch = batchList.firstWhere(
                        (b) => b.id == student.bachId,
                        orElse: () => BatchModel(id: 0, batchName: 'No Batch'),
                      );

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppCard(
                          color: AppColors.backGround,
                          child: ListTile(
                            leading: Consumer<ProfileImageProvider>(
                              builder:
                                  (
                                    BuildContext context,
                                    ProfileImageProvider image,
                                    Widget? child,
                                  ) {
                                    if (image.profileImageList.isEmpty) {
                                      return const SizedBox.shrink();
                                    }

                                    final List<ProfileImageModel> studentImage =
                                        image.profileImageList
                                            .where(
                                              (img) =>
                                                  img.id ==
                                                  student.profileImageId,
                                            )
                                            .toList();

                                    return CircleAvatar(
                                      radius: 20,
                                      backgroundImage: studentImage.isNotEmpty
                                          ? FileImage(
                                              File(
                                                studentImage.first.profileImage,
                                              ),
                                            )
                                          : null,
                                      child: studentImage.isEmpty
                                          ? Icon(Icons.person)
                                          : null,
                                    );
                                  },
                            ),
                            title: Text(student.fullName).wight().semiBold(),
                            subtitle: Row(
                              children: [
                                Text('${batch.batchName}, ').wight(),
                                SizedBox(width: 10),
                                Text(student.contactNumber).wight(),
                              ],
                            ),

                            onTap: () async {
                              setState(() {
                                isClickedSearchButton = false;
                              });
                              searchController.clear();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return StudentProfilePage(student: student);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ],
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: AppColors.boubleBig, height: 1),
          BottomNavigationBar(
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
        ],
      ),
    );
  }
}
