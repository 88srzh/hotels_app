import 'package:flutter/material.dart';
import 'package:hotel_app/resources/app_colors.dart';

class SelectionButtonWidget extends StatefulWidget {
  const SelectionButtonWidget({super.key});

  @override
  State<SelectionButtonWidget> createState() => _SelectionButtonWidgetState();
}

class _SelectionButtonWidgetState extends State<SelectionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SizedBox(
            width: 343,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(15.0)),
                backgroundColor: AppColors.hotelBottomButtonColor,
                elevation: 0,
              ),
              child: const Text('К выбору номера', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
