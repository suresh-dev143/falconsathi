import 'package:falconsathi/features/cart/view/pages/cart.dart';
import 'package:falconsathi/features/help/view/pages/help.dart';
import 'package:falconsathi/features/home/view/pages/home_page.dart';
import 'package:falconsathi/features/orders/view/pages/orders.dart';
import 'package:falconsathi/features/product/view/pages/product.dart';
import 'package:falconsathi/features/services/view/pages/services.dart';
import 'package:flutter/material.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const ProductListPage(),
    const ServicesPage(),
    const CartPage(),
    OrdersPage(),

    // const HelpPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
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
              icon: Icon(Icons.production_quantity_limits_sharp),
              label: 'PRODUCT',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cleaning_services),
              label: 'SERVICES',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'CART',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'ORDER',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.help_center),
            //   label: 'HELP',
            // ),
          ]),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
