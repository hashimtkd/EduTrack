import 'package:edu_trak/components/app_alert_popup.dart';
import 'package:edu_trak/components/app_bouble.dart';
import 'package:edu_trak/components/app_button.dart';

import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/screens/app_bach_home_page.dart';

import 'package:edu_trak/screens/bottomNavigationScreens/bach_home_page.dart';
import 'package:edu_trak/screens/edit_teacher_profile.dart';
import 'package:edu_trak/screens/login_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.backgroundw,
        backgroundColor: AppColors.boubleBig,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.backGround,
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/OIP (2).webp'),
                    ),
                    SizedBox(height: 10),
                    Text('Jone Honai').wight(),

                    Text('Maths').wight(),
                    Text('9895475336').green(),
                    Text('jonetech336@gmail.com').wight(),
                    SizedBox(height: 20),
                    AppCard(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EditTeacherProfile();
                          },
                        ),
                      ),

                      width: 200,
                      border: Border.all(color: AppColors.backgroundw),
                      child: Text('Edit').bold().wight(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 403),
              InkWell(
                onTap: () => appAlertPopup(
                  context: context,
                  title: Text('Warning!').red(),
                  content: Center(
                    heightFactor: 0,
                    child: Text('Are you sure?').blue().size(20),
                  ),
                  action: [
                    AppButton(
                      onTap: () => Navigator.pop(context),
                      width: 0.20,
                      hight: 0.15,
                      child: Text('Cancel').blue().bold(),
                    ),
                    AppButton(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginPage();
                          },
                        ),
                      ),
                      width: 0.10,
                      hight: 0.15,
                      child: Text('Ok').bold().blue(),
                    ),
                  ],
                ),
                child: Text('Log out').bold().wight().size(17),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 150,
            right: -150,

            child: AppBouble(width: 1, hight: 1, color: AppColors.boubleSmall),
          ),
          Positioned(
            top: 150,
            left: -150,

            child: AppBouble(
              width: 1.1,
              hight: 1.1,
              color: AppColors.boubleMedium,
            ),
          ),
          Positioned(
            top: -80,
            left: -50,
            right: -50,
            child: AppBouble(
              width: 1.2,
              hight: 1.2,
              color: AppColors.boubleBig,
            ),
          ),
          Positioned(
            top: 10,
            left: 80,
            child: Container(
              child: Text('Your Bach List').wight().size(32).semiBold(),
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: yourBachList.isEmpty
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        'Your bach list is empty \nplease add your bachs',
                      ).size(20).semiBold().blue().onBoardingBText(),
                    ),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) => AppCard(
                      onLongPress: () => appAlertPopup(
                        context: context,
                        content: Text('Do you want to delete this profile?'),
                        action: [
                          AppButton(
                            onTap: () => Navigator.pop(context),
                            width: 0.20,
                            hight: 0.15,
                            child: Text('Cancel').blue().bold(),
                          ),
                          AppButton(
                            onTap: () {
                              setState(() {
                                yourBachList.removeAt(index);
                                Navigator.pop(context);
                              });
                            },
                            width: 0.10,
                            hight: 0.15,
                            child: Text('Ok').bold().blue(),
                          ),
                        ],
                      ),
                      border: Border.all(color: AppColors.backgroundw),
                      color: AppColors.boubleBig,
                      child: Text(
                        yourBachList[index],
                      ).semiBold().wight().size(20),
                      onTap: () => Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return AppBachHomePage();
                              },
                            ),
                          )
                          .then((_) {
                            setState(() {});
                          }),
                    ),

                    itemCount: yourBachList.length,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: AppColors.backgroundw,
        backgroundColor: AppColors.backGround,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
