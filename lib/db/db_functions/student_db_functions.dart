import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/student_model/student_model.dart';

class StudentDbFunctions {
  static final box = HiveBoxes.studentBox;

  static Future<void> insert(StudentModel studentModel) async {
    print(studentModel);

    final key = await box!.add(studentModel);
    studentModel.id = key;

    await getAll();
  }

  static Future<List<StudentModel>> getAll() async {
    List<StudentModel> list = [];
    for (var key in box!.keys) {
      final model = box!.get(key);
      if (model != null) {
        model.id = key as int;

        list.add(model);
      }
    }

    return list;
  }

  static Future<void> delete(int id) async {
    await box!.delete(id);
  }

  static Future<void> update(StudentModel studentModel) async {
    await box!.put(studentModel.id, studentModel);
  }
}
