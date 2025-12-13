import 'package:edu_trak/models/attendance_status_model.dart';
import 'package:edu_trak/models/bach_model.dart';
import 'package:edu_trak/models/student_model.dart';
import 'package:edu_trak/models/subject_model.dart';
import 'package:edu_trak/models/teacher_model.dart';
import 'package:edu_trak/models/time_table_model.dart';
import 'package:edu_trak/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveBoxes {
  static Box<StudentModel>? studentBox;
  static Box<SubjectModel>? subjectBox;
  static Box<TeacherModel>? teacherBox;
  static Box<TimeTableModel>? timeTableBox;
  static Box<AttendanceStatusModel>? attendanceStatusBox;
  static Box<BatchModel>? batchBox;
  static Box<UserModel>? userBox;
}
