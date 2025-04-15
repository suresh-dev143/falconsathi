import 'package:falconsathi/features/auth/view/pages/login_page.dart';
import 'package:falconsathi/features/purchase/view/pages/purchase.dart';
import 'package:falconsathi/features/seller/home/view/pages/sellerhome.dart';
import 'package:falconsathi/features/seller/registration/view/pages/seller_registration.dart';
import 'package:falconsathi/features/services/view/pages/services.dart';
import 'package:falconsathi/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'features/home/view/pages/bottom_nav.dart';
import 'pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SellerRegistrationPage(),
    );
  }
}
