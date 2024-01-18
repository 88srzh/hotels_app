import 'package:flutter/material.dart';
import 'package:hotel_app/resources/app_colors.dart';

class ReservationTourPricesTextWidget extends StatelessWidget {
  const ReservationTourPricesTextWidget({
    super.key,
    required this.header,
    required this.amount,
    required this.color,
  });

  final String header;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: const TextStyle(fontSize: 16, color: AppColors.greyText, fontWeight: FontWeight.w400),
        ),
        Text(
          amount,
          style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
