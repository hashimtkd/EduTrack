import 'package:edu_trak/utils/app_colors.dart';

import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final Text text;
  final String validation;
  final TextInputType? inputType;
  final ValueChanged<String>? autoFill;
  final TextEditingController? controller;
  const AppTextField({
    super.key,
    required this.text,
    required this.validation,
    this.inputType,
    this.autoFill,
    this.controller,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      height: size.width * 0.150,
      width: size.width * 0.72,

      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.backGround),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        onChanged: widget.autoFill,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.text.data,
          hintStyle: TextStyle(color: AppColors.backGround),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.validation;
          }
          return null;
        },
      ),
    );
  }
}
