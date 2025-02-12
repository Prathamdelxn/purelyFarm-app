
import 'package:ecom/screens/cartPage.dart';
import 'package:ecom/screens/categoriesPageNew.dart';
import 'package:ecom/screens/homePage.dart';
import 'package:ecom/screens/profilePage.dart';
import 'package:flutter/material.dart';

class Navigationpage extends StatefulWidget {
  final int selectedIndex; // Accept selected index

  const Navigationpage(
      {super.key, this.selectedIndex = 0}); // Default is HomePage

  @override
  State<Navigationpage> createState() => _NavigationpageState();
}

class _NavigationpageState extends State<Navigationpage> {
  Color bottomNavBgColor = const Color.fromARGB(255, 12, 107, 12);
  late int PageIndex;

  List<Widget> pages = [
    HomePage(),
    // CategoriesPage(),
    NewCategoryPage(),
    Cartpage(),
    Profilepage(),
  ];

  @override
  void initState() {
    super.initState();
    PageIndex = widget.selectedIndex; // Set initial index from parameter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 77, 10),
      body: Stack(
        children: [
          pages[PageIndex],
          Positioned(
            bottom: 20,
            left: 24,
            right: 24,
            child: Container(
              height: 60,
              padding: EdgeInsets.only(right: 12, left: 12),
              decoration: BoxDecoration(
                color: bottomNavBgColor.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: bottomNavBgColor.withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 20,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 0),
                  _buildNavItem(Icons.category, 1),
                  _buildNavItem(Icons.shopping_cart, 2),
                  _buildNavItem(Icons.person, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build bottom navigation items with underline effect
  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = PageIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          PageIndex = index;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(height: 4),
              if (isSelected) // Show underline only for the selected icon
                Container(
                  height: 3,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
