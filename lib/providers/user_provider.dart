import 'package:edu_trak/db/db_functions/user_db_functions.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  Future<String> signUp(String id, String password) async {
    final user = UserModel(id: id, password: password);
    return await UserDbFunctions.signUp(user);
  }

  bool login(String id, String password) {
    return UserDbFunctions.login(id, password);
  }

  Future<void> updatePassword(String id, String newPassword) async {
    final box = UserDbFunctions.box;
    final userData = box!.get(id);
    if (userData != null) {
      final updatedUser = UserModel(id: id, password: newPassword);
      await box.put(id, updatedUser);
      notifyListeners();
    }
  }

  List<String> userList() {
    final box = UserDbFunctions.box;
    return box!.keys.cast<String>().toList();
  }
}
