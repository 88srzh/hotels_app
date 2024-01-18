import 'package:flutter/material.dart';

AnimatedContainer buildDot({int? index, required int currentPhoto}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.only(right: 4.0),
    height: 6,
    width: currentPhoto == index ? 7 : 7,
    decoration: BoxDecoration(
      // refactoring color
      color: currentPhoto == index ? Colors.black : currentPhoto > 1 ? Colors.grey : Colors.grey[300],
      borderRadius: BorderRadius.circular(100),
    ),
  );
}
