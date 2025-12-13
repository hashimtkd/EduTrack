import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/subject_model.dart';

class SubjectDbFunctions {
  static final box = HiveBoxes.subjectBox!;
  static Future<void> insert() async {
    List<String> subjects = [
      "Maths",
      "English",
      "Malayalam",
      "Arabic",
      "Hindi",
      "Science",
      "Social",
    ];

    for (int i = 0; i < subjects.length; i++) {
      await box.put(i, SubjectModel(id: i, subject: subjects[i]));
    }

    await getAll();
  }

  static Future<List<SubjectModel>> getAll() async {
    final list = box.values.toList().cast<SubjectModel>();
    print(list);
    return list;
  }
}
