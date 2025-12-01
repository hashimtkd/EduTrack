import 'package:edu_trak/utils/app_colors.dart';
import 'package:flutter/material.dart';

void appSnackBar(BuildContext context, Text content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: AppColors.backgroundw, content: content),
  );
}
