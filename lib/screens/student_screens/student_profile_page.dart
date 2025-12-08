import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/screens/student_screens/edit_student_profile_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.backGround),
      backgroundColor: AppColors.backGround,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/OIP (2).webp'),
            ),
            SizedBox(height: 10),
            Text('Muhammad Hashim').wight(),
            Text('s/o Rsak,Pullanikkundan(H),\nTirurkkad,Malappuram').wight(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('A+').red(),
                Icon(Icons.water_drop, color: Colors.red, size: 14),
              ],
            ),
            Text('Flutter').wight(),
            Text('9895475336').green(),
            Text('hashimtech336@gmail.com').wight(),
            SizedBox(height: 10),
            AppButton(
              hight: 0.100,
              width: 0.700,
              border: Border.all(color: AppColors.backgroundw),
              child: Text('Edit').wight().size(16).semiBold(),
              onTap: () => Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return EditStudentProfilePage();
                      },
                    ),
                  )
                  .then((_) {
                    setState(() {});
                  }),
            ),
            SizedBox(height: 20),
            AppCard(
              width: size.width * 0.700,

              color: AppColors.backgroundw,
              child: Column(
                children: [
                  Text('Today').blue().bold().size(16),

                  Text('Present').green(),
                ],
              ),
            ),
            SizedBox(height: 10),
            AppCard(
              width: size.width * 0.700,
              hight: size.height * 0.100,
              color: AppColors.backgroundw,
              child: Column(
                children: [
                  Text('November').blue().bold().size(16),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total attendance :').blue(),
                      Text('25').green(),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total absentees  :').blue(),
                      Text('2').red(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            AppCard(
              width: size.width * 0.700,
              hight: size.height * 0.100,
              color: AppColors.backgroundw,
              child: Column(
                children: [
                  Text('2025-2026').blue().bold().size(16),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total attendance :').blue(),
                      Text('25').green(),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total absentees  :').blue(),
                      Text('2').red(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
