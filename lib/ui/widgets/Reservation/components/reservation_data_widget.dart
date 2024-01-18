import 'package:flutter/material.dart';
import 'package:hotel_app/domain/entity/reservation.dart';
import 'package:hotel_app/ui/widgets/Reservation/components/reservation_black_data_text_widget.dart';
import 'package:hotel_app/ui/widgets/Reservation/components/reservation_grey_data_text_widget.dart';

class ReservationDataWidget extends StatelessWidget {
  const ReservationDataWidget({
    super.key,
    required this.reservation,
  });

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                const ReservationGreyDataText(text: 'Вылет из'),
                ReservationBlackDataText(reservation: reservation.departure),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const ReservationGreyDataText(text: 'Страна, город'),
                ReservationBlackDataText(reservation: reservation.arrivalCountry),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const ReservationGreyDataText(text: 'Даты'),
                ReservationBlackDataText(reservation: '${reservation.tourDateStart} - ${reservation.tourDateStop}')
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const ReservationGreyDataText(text: 'Кол-во ночей'),
                ReservationBlackDataText(reservation: reservation.numberOfNights.toString()),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const ReservationGreyDataText(text: 'Отель'),
                Expanded(child: ReservationBlackDataText(reservation: reservation.hotelName)),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const ReservationGreyDataText(text: 'Номер'),
                Expanded(child: ReservationBlackDataText(reservation: reservation.room)),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const ReservationGreyDataText(text: 'Питание'),
                ReservationBlackDataText(reservation: reservation.nutrition),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
