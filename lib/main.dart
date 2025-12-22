import 'package:edu_trak/db/db_functions/bach_db_functions.dart';
import 'package:edu_trak/db/db_functions/subject_db_functions.dart';
import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/attendanc_model/attendance_status_model.dart';
import 'package:edu_trak/models/bach_model/bach_model.dart';
import 'package:edu_trak/models/profile_image_model/profile_image_model.dart';
import 'package:edu_trak/models/student_model/student_model.dart';
import 'package:edu_trak/models/subject_model/subject_model.dart';
import 'package:edu_trak/models/teacher_model/teacher_model.dart';
import 'package:edu_trak/models/time_table_model/time_table_model.dart';
import 'package:edu_trak/models/user_model/user_model.dart';

import 'package:edu_trak/providers/attendance_provider.dart';
import 'package:edu_trak/providers/bach_provider.dart';
import 'package:edu_trak/providers/profile_image_provider.dart';
import 'package:edu_trak/providers/student_provider.dart';
import 'package:edu_trak/providers/subject_provider.dart';
import 'package:edu_trak/providers/teacher_provider.dart';
import 'package:edu_trak/providers/time_table_provider.dart';
import 'package:edu_trak/providers/user_provider.dart';
import 'package:edu_trak/screens/splash_screen/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(SubjectModelAdapter());
  }
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(TeacherModelAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(TimeTableModelAdapter());
  }
  if (!Hive.isAdapterRegistered(5)) {
    Hive.registerAdapter(AttendanceStatusModelAdapter());
  }
  if (!Hive.isAdapterRegistered(6)) {
    Hive.registerAdapter(BatchModelAdapter());
  }
  if (!Hive.isAdapterRegistered(7)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  if (!Hive.isAdapterRegistered(8)) {
    Hive.registerAdapter(ProfileImageModelAdapter());
  }
  HiveBoxes.studentBox = await Hive.openBox<StudentModel>('studentBox');
  HiveBoxes.subjectBox = await Hive.openBox<SubjectModel>('subjectBox');
  HiveBoxes.teacherBox = await Hive.openBox<TeacherModel>('teacherBox');
  HiveBoxes.timeTableBox = await Hive.openBox<TimeTableModel>('timeTableBox');
  HiveBoxes.attendanceStatusBox = await Hive.openBox<AttendanceStatusModel>(
    'attendanceStatusBox',
  );
  HiveBoxes.userBox = await Hive.openBox<UserModel>('userBox');
  HiveBoxes.batchBox = await Hive.openBox<BatchModel>('batchBox');
  HiveBoxes.profileImageBox = await Hive.openBox<ProfileImageModel>(
    'profileImageBox',
  );
  if (HiveBoxes.batchBox!.isEmpty) {
    await BachDbFunctions.insert();
  }

  if (HiveBoxes.subjectBox!.isEmpty) {
    await SubjectDbFunctions.insert();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentProvider()),
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
        ChangeNotifierProvider(create: (_) => SubjectProvider()..getAll()),
        ChangeNotifierProvider(create: (_) => TimeTableProvider()),
        ChangeNotifierProvider(create: (_) => BachProvider()..getAll()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProfileImageProvider()..getAll()),
        ChangeNotifierProvider(create: (_) => TeacherProvider()..getAll()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduTrack',
      home: SplashScrean(),
    );
  }
}
