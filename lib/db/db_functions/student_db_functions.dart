import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/student_model/student_model.dart';

class StudentDbFunctions {
  static final student = HiveBoxes.studentBox;

  static Future<void> insert(StudentModel studentModel) async {
    print(studentModel);

    final key = await student!.add(studentModel);
    studentModel.id = key;

    await getAll();
  }

  static Future<List<StudentModel>> getAll() async {
    final list = student!.values.toList().cast<StudentModel>();
    print(list);
    return list;
  }

  static Future<void> delete(int id) async {
    await student!.delete(id);
  }

  static Future<void> update(StudentModel studentModel) async {
    await student!.put(studentModel.id, studentModel);
  }
}
