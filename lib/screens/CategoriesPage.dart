import 'dart:async';

import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List categories = [
    {'image': 'assets/images/dryfruits.png', 'name': 'DryFruits'},
    {'image': 'assets/images/fruits.png', 'name': 'Fruits'},
    {'image': 'assets/images/grains.png', 'name': 'Grains'},
    {'image': 'assets/images/vegitables.png', 'name': 'Vegitables'},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 45, 164, 45),
        centerTitle: true,
        title: Text(
          "All Categories",
          style: TextStyle(
            fontSize: width * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: width * 0.07,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          AutoScrollCards(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: width * 0.065, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.01),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: width * 0.04,
                  mainAxisSpacing: height * 0.022,
                  shrinkWrap: true,
                  children: List.generate(
                    4,
                    (index) {
                      return Container(
                        decoration: BoxDecoration(
                          // color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 45, 164, 45),
                              const Color.fromARGB(255, 17, 62, 17),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ImageWithGradientBox(categories[index]['image'],
                            categories[index]['name']),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomRow(),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.015),
      decoration: BoxDecoration(color: Colors.grey[800]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * 0.09,
            height: width * 0.09,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lock,
              color: const Color.fromARGB(255, 45, 164, 45),
              size: width * 0.06,
            ),
          ),
          Text(
            "Add items worth ₹27 to get Free Delivery",
            style: TextStyle(
              fontSize: width * 0.029,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            // padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.symmetric(vertical: height * 0.015),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.025),
              color: const Color.fromARGB(255, 45, 164, 45),
            ),
            child: Column(
              children: [
                Text(
                  "You Saved",
                  style: TextStyle(
                    fontSize: width * 0.030,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: height * 0.002,
                  color: Colors.grey[800],
                  width: width * 0.24,
                ),
                Text(
                  "₹8",
                  style: TextStyle(
                    fontSize: width * 0.030,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWithGradientBox extends StatelessWidget {
  String image;
  String name;
  ImageWithGradientBox(this.image, this.name);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width * 0.7,
            height: height * 0.16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: width * 0.007,
              ),
              image: DecorationImage(
                image: AssetImage(image),
                // image: AssetImage("assets/Healthy food.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.04,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class AutoScrollCards extends StatefulWidget {
  @override
  _AutoScrollCardsState createState() => _AutoScrollCardsState();
}

class _AutoScrollCardsState extends State<AutoScrollCards> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 0;

  final List highlights = [
    {
      'text': 'Get 40% discount on your first order from app',
      'image': 'assets/images/highlightrowbg.png'
    },
    {
      'text': 'Get 40% discount on your first order from app',
      'image': 'assets/images/highlightrowbg.png'
    },
    {
      'text': 'Get 40% discount on your first order from app',
      'image': 'assets/images/highlightrowbg.png'
    },
    {
      'text': 'Get 40% discount on your first order from app',
      'image': 'assets/images/highlightrowbg.png'
    },
  ];

  @override
  void initState() {
    super.initState();
    _autoScroll();
  }

  void _autoScroll() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        if (_currentPage >= 4) {
          _currentPage = 0; // Loop back to the first card
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.22,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 4,
        padEnds:
            false, // Removes extra spacing at start and end (Flutter 3.10+)
        itemBuilder: (context, index) {
          return _buildCard(index);
        },
      ),
    );
  }

  Widget _buildCard(int index) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.22,
      width: width,
      margin: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.04),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(width * 0.03),
        image: DecorationImage(
          image: AssetImage(highlights[index]['image']),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: height * 0.02,
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                highlights[index]['text'],
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.054,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.015,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.007, horizontal: width * 0.055),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 1),
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 147, 236, 150),
                    const Color.fromARGB(255, 13, 227, 21),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Text(
                "Shop Now",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.045),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
