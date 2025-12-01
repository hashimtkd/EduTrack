import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/screens/app_student_profile_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AppBachStudents extends StatefulWidget {
  const AppBachStudents({super.key});

  @override
  State<AppBachStudents> createState() => _AppBachStudentsState();
}

class _AppBachStudentsState extends State<AppBachStudents> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: [
        AppCard(
          onTap: () => Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AppStudentProfilePage();
                  },
                ),
              )
              .then((_) {
                setState(() {});
              }),
          color: AppColors.backGround,
          border: Border.all(color: AppColors.backgroundw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/OIP (2).webp'),
              ),
              SizedBox(height: 10),
              Text('Muhammad Hashim').wight().semiBold(),
            ],
          ),
        ),
        AppCard(
          onTap: () => Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AppStudentProfilePage();
                  },
                ),
              )
              .then((_) {
                setState(() {});
              }),
          color: AppColors.backGround,
          border: Border.all(color: AppColors.backgroundw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/OIP (2).webp'),
              ),
              SizedBox(height: 10),
              Text('Muhammad Hashim').wight().semiBold(),
            ],
          ),
        ),
        AppCard(
          color: AppColors.backGround,
          border: Border.all(color: AppColors.backgroundw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/OIP (2).webp'),
              ),
              SizedBox(height: 10),
              Text('Muhammad Hashim').wight().semiBold(),
            ],
          ),
        ),
        AppCard(
          color: AppColors.backGround,
          border: Border.all(color: AppColors.backgroundw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/OIP (2).webp'),
              ),
              SizedBox(height: 10),
              Text('Muhammad Hashim').wight().semiBold(),
            ],
          ),
        ),
      ],
    );
  }
}
