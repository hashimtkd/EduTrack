import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 7)
class UserModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String password;

  UserModel({required this.id, required this.password});
}
