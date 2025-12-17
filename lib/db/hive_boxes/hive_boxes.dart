import 'package:edu_trak/models/attendanc_model/attendance_status_model.dart';
import 'package:edu_trak/models/bach_model/bach_model.dart';
import 'package:edu_trak/models/profile_image_model/profile_image_model.dart';
import 'package:edu_trak/models/student_model/student_model.dart';
import 'package:edu_trak/models/subject_model/subject_model.dart';
import 'package:edu_trak/models/teacher_model/teacher_model.dart';
import 'package:edu_trak/models/time_table_model/time_table_model.dart';
import 'package:edu_trak/models/user_model/user_model.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static Box<StudentModel>? studentBox;
  static Box<SubjectModel>? subjectBox;
  static Box<TeacherModel>? teacherBox;
  static Box<TimeTableModel>? timeTableBox;
  static Box<AttendanceStatusModel>? attendanceStatusBox;
  static Box<BatchModel>? batchBox;
  static Box<UserModel>? userBox;
  static Box<ProfileImageModel>? profileImageBox;
}
