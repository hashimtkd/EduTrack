import 'package:edu_trak/models/subject_model/subject_model.dart';
import 'package:edu_trak/models/time_table_model/time_table_model.dart';
import 'package:edu_trak/providers/subject_provider.dart';
import 'package:edu_trak/providers/time_table_provider.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:edu_trak/components/app_button.dart';

class BachWeeklyTimetable extends StatefulWidget {
  final int batchId;

  const BachWeeklyTimetable({super.key, required this.batchId});

  @override
  State<BachWeeklyTimetable> createState() => _BachWeeklyTimetableState();
}

class _BachWeeklyTimetableState extends State<BachWeeklyTimetable> {
  final List<String> periods = ["I", "II", "III", "IV", "V", "VI", "VII"];
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void didUpdateWidget(covariant BachWeeklyTimetable oldWidget) {
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

  void editCell(String day, int periodIndex, TimeTableModel? record) {
    int? selectedSubject = record?.subjectId;
    final subjectProvider = context.read<SubjectProvider>();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Edit Subject").bold().size(20).blue(),
        content: DropdownButtonFormField<int>(
          value: selectedSubject,
          items: subjectProvider.subjectList.map((sub) {
            return DropdownMenuItem(
              value: sub.id,
              child: Text(sub.subject).bold().black(),
            );
          }).toList(),
          onChanged: (v) => selectedSubject = v,
        ),
        actions: [
          AppButton(
            width: 0.25,
            hight: 0.15,
            onTap: () => Navigator.pop(context),
            child: Text('Cancel').blue().bold(),
          ),
          AppButton(
            width: 0.25,
            hight: 0.15,
            onTap: () async {
              if (selectedSubject == null) return;

              final provider = context.read<TimeTableProvider>();

              if (record == null) {
                final newRecord = TimeTableModel(
                  id: null,
                  batchId: widget.batchId,
                  day: day,
                  period: periodIndex + 1,
                  subjectId: selectedSubject!,
                );
                await provider.insert(newRecord);
              } else {
                final updated = TimeTableModel(
                  id: record.id,
                  batchId: widget.batchId,
                  day: day,
                  period: record.period,
                  subjectId: selectedSubject!,
                );
                await provider.update(updated);
              }

              Navigator.pop(context);
            },
            child: Text('Save').bold().blue(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.watch<TimeTableProvider>();
    final subjectProvider = context.watch<SubjectProvider>();
    final allRecords = timeProvider.timeTableList;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(),
          columns: [
            DataColumn(label: Text('Day').bold()),
            ...periods.map((p) => DataColumn(label: Text(p).bold())),
          ],
          rows: days.map((day) {
            final dayRecords = allRecords.where((e) => e.day == day).toList()
              ..sort((a, b) => a.period.compareTo(b.period));

            return DataRow(
              cells: [
                DataCell(Text(day).bold()),
                ...List.generate(periods.length, (index) {
                  final record = dayRecords.length > index
                      ? dayRecords[index]
                      : null;

                  final subject = record != null
                      ? subjectProvider.subjectList.firstWhere(
                          (s) => s.id == record.subjectId,
                          orElse: () => SubjectModel(id: 0, subject: "Subject"),
                        )
                      : SubjectModel(id: 0, subject: "Subject");

                  return DataCell(
                    InkWell(
                      onTap: () => editCell(day, index, record),
                      child: Container(
                        color: record == null ? Colors.yellow[100] : null,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 6,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                subject.subject,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(Icons.edit, size: 18, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
