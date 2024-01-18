import 'package:flutter/material.dart';

class HeadlineTextWidget extends StatelessWidget {
  const HeadlineTextWidget({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    );
  }
}
