import 'package:edu_trak/screens/bottomNavigationScreens/bach_home_page.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BachResultPage extends StatefulWidget {
  const BachResultPage({super.key});

  @override
  State<BachResultPage> createState() => _BachResultPageState();
}

class _BachResultPageState extends State<BachResultPage> {
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
        : Container(
            child: Center(
              child: Text('Result not added').size(20).semiBold().blue(),
            ),
          );
  }
}
