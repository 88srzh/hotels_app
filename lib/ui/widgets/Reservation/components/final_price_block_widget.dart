import 'package:flutter/material.dart';
import 'package:hotel_app/resources/app_colors.dart';
import 'package:hotel_app/ui/widgets/Reservation/components/reservation_tour_prices_text_widget.dart';

class FinalPriceBlockWidget extends StatelessWidget {
  const FinalPriceBlockWidget({
    super.key,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
    required this.payable,
  });

  final String tourPrice;
  final String fuelCharge;
  final String serviceCharge;
  final String payable;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Column(
          children: [
            ReservationTourPricesTextWidget(header: 'Тур', amount: '$tourPrice ₽', color: Colors.black),
            const SizedBox(height: 10.0),
            ReservationTourPricesTextWidget(header: 'Топливный сбор', amount: '$fuelCharge ₽', color: Colors.black),
            const SizedBox(height: 10.0),
            ReservationTourPricesTextWidget(header: 'Сервисный сбор', amount: '$serviceCharge ₽', color: Colors.black),
            const SizedBox(height: 10.0),
            ReservationTourPricesTextWidget(header: 'К оплате', amount: '$payable ₽', color: AppColors.roomDetailsTextColor),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
