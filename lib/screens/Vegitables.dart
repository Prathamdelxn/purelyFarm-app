import 'package:flutter/material.dart';

class Vegitables extends StatefulWidget {
  const Vegitables({super.key});

  @override
  State<Vegitables> createState() => _VegitablesState();
}

class _VegitablesState extends State<Vegitables> {
  final List categories = [
    {'image': 'assets/images/vegitables.png', 'name': 'Vegitable'},
    {'image': 'assets/images/dryfruits.png', 'name': 'DryFruits'},
    {'image': 'assets/images/fruits.png', 'name': 'Fruits'},
    {'image': 'assets/images/grains.png', 'name': 'Grains'},
  ];

  List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/cabbage.png",
      "name": "Cabbage",
      "weight": "1 kg",
      "stars": 4.5,
      "price": 40.0
    },
    {
      "image": "assets/images/carrot.png",
      "name": "Carrot",
      "weight": "1.5 kg",
      "stars": 4.0,
      "price": 1.99
    },
    {
      "image": "assets/images/cucumber.png",
      "name": "Cucumber",
      "weight": "2 kg",
      "stars": 4.2,
      "price": 3.49
    },
    {
      "image": "assets/images/green_peas.png",
      "name": "Green Peas",
      "weight": "0.5 kg",
      "stars": 4.7,
      "price": 4.99
    },
    {
      "image": "assets/images/onion.png",
      "name": "Onion",
      "weight": "0.75 kg",
      "stars": 4.8,
      "price": 5.99
    },
    {
      "image": "assets/images/tomato.png",
      "name": "Tomato",
      "weight": "5 kg",
      "stars": 4.6,
      "price": 7.99
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Vegitables",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
            color: Colors.white,
            iconSize: 30,
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(right: BorderSide.none),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              // spacing: 30,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SidebarCategories(
                  categories[0]['image'],
                  categories[0]['name'],
                ),
                SidebarCategories(
                  categories[1]['image'],
                  categories[1]['name'],
                ),
                SidebarCategories(
                  categories[2]['image'],
                  categories[2]['name'],
                ),
                SidebarCategories(
                  categories[3]['image'],
                  categories[3]['name'],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Container(
                  height: height * 0.18,
                  width: 311,
                  padding: EdgeInsets.only(left: 15, top: 30),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(width * 0.03),
                    image: DecorationImage(
                      image: AssetImage('assets/images/vegitables.png'),
                      fit: BoxFit.cover,
                      opacity: 0.7,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.005,
                            horizontal: width * 0.035),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(width * 1),
                        ),
                        child: Text(
                          "Upto 25% Off",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.03),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          'New \nLaunch',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.05,
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
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.005,
                            horizontal: width * 0.035),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(width * 1),
                        ),
                        child: Text(
                          "Order Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.04),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SizedBox(
                    width: width * 0.72,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.525,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          products[index]['image'],
                          products[index]['name'],
                          products[index]['weight'],
                          products[index]['stars'],
                          products[index]['price'],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SidebarCategories(String image, String name) {
    return Container(
      width: 80,
      height: 110,
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Colors.green,
          Colors.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        // spacing: 6,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image),
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget ProductCard(
      String image, String name, String weight, double stars, double price) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        // color: Colors.white,
        border:
            Border.all(color: const Color.fromARGB(255, 2, 100, 5), width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 229, 239, 231),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            height: 100,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(30), // Optional rounded corners
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit
                    .cover, // Crops the image to fill 100x70 without distortion
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            weight,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.amber,
            ),
            padding: EdgeInsets.only(right: 5, left: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.white, size: 18),
                const SizedBox(width: 4),
                Text(
                  stars.toString(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "\₹${price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Container(
              width: 130,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Add to Cart",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
