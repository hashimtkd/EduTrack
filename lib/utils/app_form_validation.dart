import 'package:flutter/material.dart';

extension AppFormValidation on TextFormField {
  TextFormField validation(String text) => TextFormField(
    controller: this.controller,

    onChanged: this.onChanged,
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
