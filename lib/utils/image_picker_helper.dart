import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as p;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerHelper {
  static final imagePicker = ImagePicker();
  static final ImageCropper imageCoopper = ImageCropper();

  static Future<String> pickFromCamera() async {
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    return await saveToFile(pickedImage);
  }

  static Future<String> pickFromGallery() async {
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    return await saveToFile(pickedImage);
  }

  static Future<String> saveToFile(XFile? pickedImage) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = "profile${DateTime.now().microsecondsSinceEpoch}.png";
    final String newPath = p.join(directory.path, fileName);
    if (pickedImage == null) return "image saving is filed,Try again";
    final savedImage = await File(pickedImage.path).copy(newPath);
    print(savedImage.path);
    return savedImage.path;
  }

  static Future<String> delete(File image) async {
    await image.delete();
    return " old Profile deleted";
  }

  static Future<XFile?> _editImage(XFile pickedImage) async {
    final CroppedFile? croppedImage = await imageCoopper.cropImage(
      sourcePath: pickedImage.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edit Image',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Edit Image'),
      ],
    );

    if (croppedImage == null) return null;

    return XFile(croppedImage.path);
  }
}
