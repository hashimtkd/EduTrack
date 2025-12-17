import 'package:edu_trak/utils/app_colors.dart';

import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final Text text;
  final String validation;
  final TextInputType? inputType;
  final ValueChanged<String>? autoFill;
  final TextEditingController? controller;
  bool passwordfeild;
  IconButton? suffixIcon;
  AppTextField({
    super.key,
    required this.text,
    required this.validation,
    this.inputType,
    this.autoFill,
    this.controller,
    this.passwordfeild = false,
    this.suffixIcon,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool hideText = isPasswordVisible;
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      height: size.width * 0.150,
      width: size.width * 0.920,

      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.backGround),
      ),
      child: TextFormField(
        obscureText: hideText,
        controller: widget.controller,
        keyboardType: widget.inputType,
        onChanged: widget.autoFill,
        decoration: InputDecoration(
          suffixIcon:
              widget.suffixIcon ??
              (widget.passwordfeild == false
                  ? null
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible == false
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    )),
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
