import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/components/app_snack_bar.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/bach_home_page.dart';
import 'package:edu_trak/screens/home_page.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BachListPage extends StatefulWidget {
  const BachListPage({super.key});

  @override
  State<BachListPage> createState() => _BachListPageState();
}

class _BachListPageState extends State<BachListPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List bachList = ['Flutter', 'Mern Stack', 'Java', 'Java Script'];
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 115,
            child: Container(
              child: Text('Bach List').size(32).wight().semiBold(),
            ),
          ),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            bottom: 0,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => AppCard(
                color: AppColors.backgroundw,
                child: Text(bachList[index]).semiBold().blue().size(20),
                onTap: () {
                  if (!yourBachList.contains(bachList[index])) {
                    yourBachList.add(bachList[index]);
                    Navigator.pop(context);
                  } else {
                    appSnackBar(
                      context,
                      Text(
                        'Sorry, this bach is already exist in your bach list',
                      ).blue().bold(),
                    );
                  }
                },
              ),

              itemCount: bachList.length,
            ),
          ),
        ],
      ),
    );
  }
}
