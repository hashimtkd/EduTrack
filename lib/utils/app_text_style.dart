import 'package:flutter/material.dart';

extension AppTextStyle on Text {
  Text size(double value) => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(fontSize: value),
  );

  Text red() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(
      color: Color.fromRGBO(255, 0, 0, 100),
    ),
  );

  Text blue() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(
      color: Color.fromRGBO(13, 7, 130, 100),
    ),
  );

  Text green() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(
      color: Color.fromRGBO(15, 237, 78, 100),
    ),
  );

  Text black() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(
      color: Color.fromRGBO(0, 0, 0, 100),
    ),
  );

  Text wight() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(
      color: Color.fromRGBO(255, 255, 255, 100),
    ),
  );
}
