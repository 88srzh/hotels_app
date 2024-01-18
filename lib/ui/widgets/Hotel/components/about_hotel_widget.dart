import 'package:flutter/material.dart';
import 'package:hotel_app/domain/entity/hotel.dart';
import 'package:hotel_app/resources/app_colors.dart';
import 'package:hotel_app/resources/resources.dart';
import 'package:hotel_app/ui/widgets/hotel/components/custom_divider.dart';
import 'package:hotel_app/ui/widgets/hotel/components/custom_list_tile.dart';

class AboutHotelWidget extends StatelessWidget {
  const AboutHotelWidget({
    super.key,
    required this.peculiarities,
    required this.hotel,
  });

  final String peculiarities;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Об отеле',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              peculiarities,
              maxLines: 3,
              style: const TextStyle(
                backgroundColor: AppColors.greyBackgroundText,
                color: AppColors.greyText,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              hotel.aboutTheHotel.description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.greyBackgroundText,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Column(
                children: [
                  CustomListTile(leadingImage: AppImages.emojiHappy, firstText: 'Удобства'),
                  CustomDivider(),
                  CustomListTile(leadingImage: AppImages.tickSquare, firstText: 'Что включено'),
                  CustomDivider(),
                  CustomListTile(leadingImage: AppImages.closeSquare, firstText: 'Что не включено'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
