import 'package:falconsathi/features/home/view/pages/homepage.dart';
import 'package:falconsathi/features/home/view/pages/orderpage.dart';
import 'package:flutter/material.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List<Widget> pages = [const HomePage(), const OrdarPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Pallete.dividerColor,
          unselectedItemColor: Colors.white,
          backgroundColor: Pallete.blueDarkColor,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'ORDER',
            ),
          ]),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
