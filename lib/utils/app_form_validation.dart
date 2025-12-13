import 'package:flutter/material.dart';

extension AppFormValidation on TextFormField {
  TextFormField validation(String text) => TextFormField(
    controller: controller,

    onChanged: onChanged,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return text;
      }
      return null;
    },
  );

  TextFormField keyboard(TextInputType inputType) =>
      TextFormField(keyboardType: inputType);
}
