import 'package:falconsathi/features/auth/view/pages/login_page.dart';
import 'package:falconsathi/features/home/view/pages/homepage.dart';
import 'package:falconsathi/features/purchase/view/pages/purchase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
