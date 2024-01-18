import 'package:flutter/material.dart';
import 'package:hotel_app/resources/app_colors.dart';
import 'package:hotel_app/ui/widgets/hotel/hotel_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          // enabledBorder: InputBorder.none,
          filled: true,
          fillColor: AppColors.formBackgroundColor,
          outlineBorder: BorderSide(color: AppColors.formBackgroundColor, style: BorderStyle.solid),
        ),
        fontFamily: 'SF Pro Display',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HotelWidget(),
    );
  }
}
