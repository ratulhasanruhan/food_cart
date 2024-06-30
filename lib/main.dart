import 'package:flutter/material.dart';
import 'package:food_cart/utils/colors.dart';
import 'package:food_cart/view/CartScreen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/CartBinding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: CartScreen(),
      initialBinding: CartBinding(),
    );
  }
}
