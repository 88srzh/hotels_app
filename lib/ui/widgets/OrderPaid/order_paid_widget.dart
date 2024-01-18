import 'package:flutter/material.dart';
import 'package:hotel_app/resources/app_colors.dart';
import 'package:hotel_app/resources/resources.dart';
import 'package:hotel_app/ui/components/custom_app_bar_widget.dart';
import 'package:hotel_app/ui/components/custom_bottom_navigation_bar.dart';
import 'package:hotel_app/ui/widgets/Hotel/hotel_widget.dart';

class OrderPaidWidget extends StatelessWidget {
  const OrderPaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Заказ оплачен'),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 400,
          child: ListView(
            children: [
              Column(
                children: [
                  Image.asset(AppImages.congratulationsIcon),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Ваш заказ принят в работу',
                    style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Подтверждение заказа №104893 может\n занять некоторое время (от 1 часа до суток).\n Как только мы получим ответ от\n туроператора, вам на почту придет\n уведомление.',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        text: 'Супер',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HotelWidget()));
        },
      ),
    );
  }
}
