import 'package:flutter/material.dart';
import 'package:hotel_app/domain/entity/reservation.dart';
import 'package:hotel_app/resources/app_colors.dart';
import 'package:hotel_app/ui/components/five_star_row.dart';
import 'package:hotel_app/ui/components/headline_text_widget.dart';

class HotelBlockWidget extends StatelessWidget {
  const HotelBlockWidget({
    super.key,
    required this.reservation,
  });

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            FiveStarRowWidget(rating: reservation.horating.toString(), ratingName: reservation.ratingName),
            const SizedBox(height: 10.0),
            const HeadlineTextWidget(text: 'Steigenberger Makadi'),
            Text(
              reservation.hotelAdress,
              style: const TextStyle(fontSize: 14, color: AppColors.blueText),
            ),
          ],
        ),
      ),
    );
  }
}
