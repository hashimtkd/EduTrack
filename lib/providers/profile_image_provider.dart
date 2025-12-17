import 'package:edu_trak/db/db_functions/profile_image_db_functions.dart';
import 'package:edu_trak/models/profile_image_model/profile_image_model.dart';

import 'package:flutter/material.dart';

class ProfileImageProvider extends ChangeNotifier {
  List<ProfileImageModel> _profileImageList = [];

  List<ProfileImageModel> get profileImageList => _profileImageList;

  Future<int?> insert(ProfileImageModel image) async {
    final imgId = await ProfileImageDbFunctions.insert(image);
    await getAll();
    return imgId;
  }

  Future<void> getAll() async {
    _profileImageList = await ProfileImageDbFunctions.getAll();
    print(_profileImageList);
    notifyListeners();
  }

  Future<int?> update(ProfileImageModel image) async {
    final id = await ProfileImageDbFunctions.update(image);
    await getAll();
    return id;
  }

  Future<void> delete(String profileImage, int? id) async {
    final msg = await ProfileImageDbFunctions.delete(profileImage, id);
    print(msg);
    await getAll();
  }
}
