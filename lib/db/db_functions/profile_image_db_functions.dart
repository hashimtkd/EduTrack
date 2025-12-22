import 'dart:io';

import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/profile_image_model/profile_image_model.dart';

import 'package:edu_trak/utils/image_picker_helper.dart';

class ProfileImageDbFunctions {
  static final box = HiveBoxes.profileImageBox;

  static Future<int?> insert(ProfileImageModel image) async {
    final key = await box!.add(image);
    image.id = key;
    return image.id;
  }

  static Future<List<ProfileImageModel>> getAll() async {
    List<ProfileImageModel>? list = [];
    for (var key in box!.keys) {
      final model = box!.get(key);
      if (model != null) {
        model.id = key as int;

        list.add(model);
      }
    }

    return list;
  }

  static Future<int?> update(ProfileImageModel image) async {
    final id = image.id;
    await box!.put(id, image);
    return id;
  }

  static Future<String> delete(String profileImage, int? id) async {
    await box!.delete(id);
    return await ImagePickerHelper.delete(File(profileImage));
  }
}
