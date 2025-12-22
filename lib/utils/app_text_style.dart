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
      color: Color.fromRGBO(13, 7, 130, 1),
    ),
  );

  Text green() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(
      color: Color.fromRGBO(15, 237, 78, 1),
    ),
  );

  Text black() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(
      color: Color.fromRGBO(0, 0, 0, 1),
    ),
  );

  Text wight() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
  );

  Text bold() => Text(
    data!,
    style: (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.bold),
  );

  Text semiBold() => Text(
    data!,
    style: (style ?? TextStyle()).copyWith(fontWeight: FontWeight.w600),
  );
  Text onBoardingBText() => Text(
    data!,
    style: (style ?? TextStyle()).copyWith(fontFamily: 'Inconsolata'),
  );

  Text splashScreanText() => Text(
    data!,
    style: (style ?? TextStyle()).copyWith(fontFamily: 'IrishGrover'),
  );
}

extension StringCapitalization on String {
  String firstLetterUppercase() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
