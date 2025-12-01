import 'package:flutter/material.dart';

void appPopup(
  BuildContext contex,
  Widget title,
  Widget content,
  List<Widget> actionList,
) {
  showDialog(
    context: contex,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: title),
        content: content,
        actions: actionList,
      );
    },
  );
}
