import 'package:falconsathi/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.blueDarkColor,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Container(
          child: Center(
        child: Text("Welcome"),
      )),
    );
  }
}
