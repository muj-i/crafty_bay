import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(
            ColorPalette.primaryColor.value, ColorPalette().colors),
      ),
      home: const SplashScreen(),
    );
  }
}
