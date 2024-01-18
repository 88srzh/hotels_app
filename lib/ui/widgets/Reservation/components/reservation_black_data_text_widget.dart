import 'package:flutter/material.dart';

class ReservationBlackDataText extends StatelessWidget {
  const ReservationBlackDataText({
    super.key,
    required this.reservation,
  });

  final String reservation;

  @override
  Widget build(BuildContext context) {
    return Text(
      reservation,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}
