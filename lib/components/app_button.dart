import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 52,
        width: 293,
        decoration: BoxDecoration(
          color: Color.fromRGBO(13, 7, 130, 100),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text('Save')),
      ),
    );
  }
}
