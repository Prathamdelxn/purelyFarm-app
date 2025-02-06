// import 'package:ecom/screens/CategoriesPage.dart';
// import 'package:ecom/screens/Vegitables.dart';
// import 'package:ecom/screens/cartPage.dart';
// import 'package:ecom/screens/homePage.dart';
// import 'package:ecom/screens/profilePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sticky_headers/sticky_headers.dart';

// class Navigationpage extends StatefulWidget {
//   const Navigationpage({super.key});

//   @override
//   State<Navigationpage> createState() => _NavigationpageState();
// }

// class _NavigationpageState extends State<Navigationpage> {
//   Color bottomNavBgColor = const Color.fromARGB(255, 12, 107, 12);
//   int PageIndex = 0;
//   List<Widget> pages = [
//     HomePage(),
//     CategoriesPage(),
//     Cartpage(),
//     Profilepage()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 7, 77, 10),
//       body: Stack(
//         children: [
//           pages[PageIndex],
//           Positioned(
//             bottom: 20,
//             left: 24,
//             right: 24,
//             child: Container(
//               height: 60,
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: bottomNavBgColor.withOpacity(0.8),
//                 borderRadius: BorderRadius.all(Radius.circular(24)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: bottomNavBgColor.withOpacity(0.3),
//                     offset: Offset(0, 20),
//                     blurRadius: 20,
//                   )
//                 ],
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           PageIndex = 0;
//                         });
//                       },
//                       icon: Icon(Icons.home, color: Colors.white)),
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           PageIndex = 1;
//                         });
//                       },
//                       icon: Icon(Icons.category, color: Colors.white)),
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           PageIndex = 2;
//                         });
//                       },
//                       icon: Icon(Icons.shopping_cart, color: Colors.white)),
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           PageIndex = 3;
//                         });
//                       },
//                       icon: Icon(Icons.person, color: Colors.white)),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom Delegate for Persistent Search Bar
// class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   double get minExtent => 60;
//   @override
//   double get maxExtent => 60;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: const Color.fromARGB(255, 7, 77, 10),
//       padding: EdgeInsets.symmetric(horizontal: 26),
//       alignment: Alignment.center,
//       child: TextField(
//         style: TextStyle(fontFamily: "Montserratmedium"),
//         decoration: InputDecoration(
//           hintText: "Search Your Groceries",
//           prefixIcon: Icon(Icons.search),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(22),
//           ),
//           filled: true,
//           fillColor: Colors.grey[200],
//         ),
//       ),
//     );
//   }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }

import 'package:ecom/screens/CategoriesPage.dart';
import 'package:ecom/screens/cartPage.dart';
import 'package:ecom/screens/homePage.dart';
import 'package:ecom/screens/profilePage.dart';
import 'package:flutter/material.dart';

class Navigationpage extends StatefulWidget {
  const Navigationpage({super.key});

  @override
  State<Navigationpage> createState() => _NavigationpageState();
}

class _NavigationpageState extends State<Navigationpage> {
  Color bottomNavBgColor = const Color.fromARGB(255, 12, 107, 12);
  int PageIndex = 0;
  List<Widget> pages = [
    HomePage(),
    CategoriesPage(),
    Cartpage(),
    Profilepage()
  ];

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
        // color: Colors.amber,
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
