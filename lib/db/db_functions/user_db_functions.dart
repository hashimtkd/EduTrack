import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/user_model/user_model.dart';

class UserDbFunctions {
  static final box = HiveBoxes.userBox;

  static Future<String> signUp(UserModel user) async {
    if (box!.containsKey(user.id)) {
      return "Account already exists";
    }
    await box!.put(user.id, user);
    return "Success";
  }

  static bool login(String id, String password) {
    final user = box!.get(id);
    if (user == null) return false;
    return user.password == password;
  }

  static Future<String> updatePassword(String id, String newPassword) async {
    final user = box!.get(id);
    if (user == null) {
      return "User not found";
    }

    final updatedUser = UserModel(id: user.id, password: newPassword);
    await box!.put(id, updatedUser);
    return "Password updated successfully";
  }

  static List<String> allUserIds() {
    return box!.keys.cast<String>().toList();
  }
}
