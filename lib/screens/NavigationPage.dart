import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:ecom/screens/CategoriesPage.dart';
import 'package:ecom/screens/HomePage.dart';
import 'package:ecom/screens/Vegitables.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPage = 0;
  final List<Widget> _pages = [
    HomePage(),
    CategoriesPage(),
    Vegitables(),
    CategoriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 55,
        circleSize: 40,
        arcHeight: 50,
        arcWidth: 65,
        initialSelection: currentPage,
        inactiveIconColor: Colors.grey,
        textColor: Colors.black,
        hasElevationShadows: false,
        tabs: [
          TabData(
            icon: Icons.home,
            iconSize: 25,
            title: 'Home',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.category,
            iconSize: 25,
            title: 'Categories',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.shopping_bag,
            iconSize: 25,
            title: 'Cart',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.person,
            iconSize: 25,
            title: 'Profile',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}
