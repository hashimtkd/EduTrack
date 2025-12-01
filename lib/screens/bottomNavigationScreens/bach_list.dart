import 'package:edu_trak/components/app_card.dart';

import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BachList extends StatefulWidget {
  final GestureTapCallback? onTap;
  const BachList({super.key, this.onTap});

  @override
  State<BachList> createState() => _BachListState();
}

class _BachListState extends State<BachList> {
  List bachList = ['Flutter', 'Mern Stack', 'Java', 'Java Script'];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => AppCard(
        color: AppColors.backgroundw,
        child: Text(bachList[index]).semiBold().blue().size(20),
        onTap: widget.onTap,
      ),

      itemCount: bachList.length,
    );
  }
}
