import 'package:flutter/material.dart';
import 'package:hotel_app/resources/app_colors.dart';

class FiveStarRowWidget extends StatelessWidget {
  const FiveStarRowWidget({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  final String rating;
  final String ratingName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29.0,
      width: 153.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: AppColors.orangeBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          children: [
            const Icon(Icons.star, color: AppColors.orangeText, size: 15),
            Text(
              rating,
              style: const TextStyle(color: AppColors.orangeText, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 5.0),
            Text(
              ratingName,
              style: const TextStyle(color: AppColors.orangeText, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
