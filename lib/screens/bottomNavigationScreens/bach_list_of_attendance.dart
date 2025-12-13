import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/providers/bach_provider.dart';
import 'package:edu_trak/screens/bottomNavigationScreens/attendance_page.dart';

import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BachListOfAttendance extends StatefulWidget {
  const BachListOfAttendance({super.key});

  @override
  State<BachListOfAttendance> createState() => _BachListOfAttendanceState();
}

class _BachListOfAttendanceState extends State<BachListOfAttendance> {
  @override
  Widget build(BuildContext context) {
    final bachProvider = context.watch<BachProvider>();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),

      itemCount: bachProvider.bachtList.length,

      itemBuilder: (context, index) {
        final batch = bachProvider.bachtList[index];

        return AppCard(
          color: AppColors.backgroundw,
          child: Text(batch.batchName).semiBold().blue().size(20),

          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AttendancePage(
                  batchId: batch.id!,
                  batchName: batch.batchName,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
