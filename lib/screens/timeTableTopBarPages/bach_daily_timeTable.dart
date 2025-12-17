import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/models/time_table_model/time_table_model.dart';

import 'package:edu_trak/providers/subject_provider.dart';
import 'package:edu_trak/providers/time_table_provider.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BachDailyTimetable extends StatefulWidget {
  final int batchId;

  const BachDailyTimetable({super.key, required this.batchId});

  @override
  State<BachDailyTimetable> createState() => _BachDailyTimetableState();
}

class _BachDailyTimetableState extends State<BachDailyTimetable> {
  late String today;

  @override
  void initState() {
    super.initState();
    today = _getTodayName();
    loadData();
  }

  @override
  void didUpdateWidget(covariant BachDailyTimetable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.batchId != widget.batchId) {
      loadData();
    }
  }

  void loadData() {
    Future.microtask(
      () => context.read<TimeTableProvider>().loadByBatch(widget.batchId),
    );
  }

  String _getTodayName() {
    switch (DateTime.now().weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      default:
        return "Sunday";
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.watch<TimeTableProvider>();
    final subjectProvider = context.watch<SubjectProvider>();

    List<TimeTableModel> todayList = timeProvider.timeTableList
        .where((e) => e.day == today)
        .toList();
    todayList.sort((a, b) => a.period.compareTo(b.period));

    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: todayList.length,
      itemBuilder: (_, index) {
        final record = todayList[index];
        final subject = subjectProvider.subjectList.firstWhere(
          (s) => s.id == record.subjectId,
        );

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCard(
              hight: 70,
              width: double.infinity,
              border: Border.all(),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text("Period: ${record.period}").size(20).bold().black(),
                  SizedBox(width: 50),
                  Text(subject.subject).size(20).semiBold().black(),
                  SizedBox(width: 2),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
