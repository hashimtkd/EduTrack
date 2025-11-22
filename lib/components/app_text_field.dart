import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 293,
      decoration: BoxDecoration(
        color: Color.fromRGBO(13, 7, 130, 100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(),
    );
  }
}
