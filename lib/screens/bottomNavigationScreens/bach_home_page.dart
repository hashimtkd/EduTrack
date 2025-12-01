import 'package:edu_trak/components/app_alert_popup.dart';
import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/screens/app_bach_home_page.dart';
import 'package:edu_trak/screens/app_student_profile_page.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/bach_attendance_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AppBachStudents extends StatefulWidget {
  final Function(int) changeIndex;
  const AppBachStudents({super.key, required this.changeIndex});

  @override
  State<AppBachStudents> createState() => _AppBachStudentsState();
}

List yourBachList = [];

class _AppBachStudentsState extends State<AppBachStudents> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return yourBachList.isEmpty
        ? Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                'Your bach list is empty \nplease add your bachs',
              ).size(20).semiBold().blue().onBoardingBText(),
            ),
          )
        : Column(
            children: [
              Text('Your Bach List').blue().size(22).semiBold(),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
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
          );
  }
}
