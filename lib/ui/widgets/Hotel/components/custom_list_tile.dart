import 'package:flutter/material.dart';
import 'package:hotel_app/resources/app_colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.leadingImage, required this.firstText});
  final String leadingImage;
  final String firstText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
          maxHeight: 24,
          maxWidth: 24,
        ),
        child: Image.asset(leadingImage, fit: BoxFit.cover),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
        firstText,
        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: const Text(
        'Самое необходимое',
        style:  TextStyle(color: AppColors.greyText, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
