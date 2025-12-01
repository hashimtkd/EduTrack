import 'package:flutter/material.dart';

void appAlertPopup({
  required BuildContext context,
  Text? title,
  Widget? content,
  List<Widget>? action,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(title: title, content: content, actions: action);
    },
  );
}
