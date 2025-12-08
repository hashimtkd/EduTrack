import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_popup.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BachWeeklyTimetable extends StatefulWidget {
  const BachWeeklyTimetable({super.key});

  @override
  State<BachWeeklyTimetable> createState() => _BachWeeklyTimetableState();
}

class _BachWeeklyTimetableState extends State<BachWeeklyTimetable> {
  final _formKey = GlobalKey<FormState>();

  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  List<List<String>> subjects = List.generate(
    7,
    (_) => List.generate(7, (_) => 'maths'),
  );

  void editCell(int dayIndex, int periodIndex) {
    TextEditingController controller = TextEditingController(
      text: subjects[dayIndex][periodIndex],
    );

    appPopup(
      context,
      Text('Edit subject'),
      Form(
        key: _formKey,
        child: AppTextField(
          validation: 'Subject is empty',
          controller: controller,
          text: Text('Subject'),
        ),
      ),
      [
        AppButton(
          onTap: () => Navigator.pop(context),
          width: 0.20,
          hight: 0.15,
          child: Text('Cancel').blue().bold(),
        ),
        AppButton(
          onTap: () {
            setState(() {
              if (_formKey.currentState!.validate()) {
                subjects[dayIndex][periodIndex] = controller.text;
                Navigator.pop(context);
              }
            });
          },
          width: 0.10,
          hight: 0.15,
          child: Text('Ok').bold().blue(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(),
          columns: [
            DataColumn(label: Text('Day')),
            DataColumn(label: Text('I')),
            DataColumn(label: Text('II')),
            DataColumn(label: Text('III')),
            DataColumn(label: Text('IV')),
            DataColumn(label: Text('V')),
            DataColumn(label: Text('VI')),
            DataColumn(label: Text('VII')),
          ],
          rows: List.generate(days.length, (dayIndex) {
            return DataRow(
              cells: [
                DataCell(Text(days[dayIndex])),
                ...List.generate(7, (periodIndex) {
                  return DataCell(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(subjects[dayIndex][periodIndex]),
                        IconButton(
                          onPressed: () {
                            editCell(dayIndex, periodIndex);
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
