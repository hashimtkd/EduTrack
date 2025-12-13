import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/providers/bach_provider.dart';
import 'package:edu_trak/screens/timeTableTopBarPages/bach_daily_timeTable.dart';
import 'package:edu_trak/screens/timeTableTopBarPages/bach_weekly_timeTable.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  String selectedButton = 'Today';
  int? selectedBatch;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final batchList = context.read<BachProvider>().bachtList;
      if (batchList.isNotEmpty) {
        selectedBatch = batchList.first.id;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final batchProvider = context.watch<BachProvider>();

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Material(
              color: AppColors.backGround,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    dropdownColor: AppColors.backGround,
                    value: selectedBatch,
                    hint: Text("Select Batch").wight(),
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    items: batchProvider.bachtList.map((b) {
                      return DropdownMenuItem(
                        value: b.id,
                        child: Text(b.batchName).bold().size(18).wight(),
                      );
                    }).toList(),
                    onChanged: (v) {
                      setState(() => selectedBatch = v);
                    },
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => setState(() => selectedButton = 'Today'),
                child: AppCard(
                  color: AppColors.backGround,
                  width: 150,
                  hight: 50,
                  border: Border.all(),
                  child: Center(
                    child: Text(
                      'Today',
                      style: TextStyle(
                        color: selectedButton == 'Today'
                            ? Colors.black
                            : Colors.white,
                      ),
                    ).bold().size(selectedButton == 'Today' ? 28 : 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () => setState(() => selectedButton = 'Week'),
                child: AppCard(
                  color: AppColors.backGround,
                  width: 150,
                  hight: 50,
                  border: Border.all(),
                  child: Center(
                    child: Text(
                      'Week',
                      style: TextStyle(
                        color: selectedButton == 'Week'
                            ? Colors.black
                            : Colors.white,
                      ),
                    ).bold().size(selectedButton == 'Week' ? 28 : 20),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Expanded(
            child: selectedBatch == null
                ? const Center(child: Text("No batch found"))
                : selectedButton == 'Today'
                ? BachDailyTimetable(batchId: selectedBatch!)
                : BachWeeklyTimetable(batchId: selectedBatch!),
          ),
        ],
      ),
    );
  }
}
