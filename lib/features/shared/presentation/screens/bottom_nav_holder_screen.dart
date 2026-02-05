import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BottomNavHolderScreen extends StatefulWidget {
  const BottomNavHolderScreen({super.key});
 static const String name = '/bottom-nav-holder';
  @override
  State<BottomNavHolderScreen> createState() => _BottomNavHolderScreenState();
}

class _BottomNavHolderScreenState extends State<BottomNavHolderScreen> {

  List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavController>(
      builder: (mainNavController) {
        return Scaffold(
          body: _screens[mainNavController.currentIndex] ,
          bottomNavigationBar: NavigationBar(
            selectedIndex: mainNavController.currentIndex,
              onDestinationSelected: mainNavController.changeIndex,
              destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.dashboard_customize_rounded),
                label: 'Categories'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_checkout_outlined),
                label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined), label: 'Wishlist  ')
          ]),

        );
      }
    );
  }
}
