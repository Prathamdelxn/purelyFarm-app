

import 'package:ecom/screens/NavigationPage.dart';
import 'package:ecom/screens/cartPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProductDetails extends StatefulWidget {
  final productInfo;
  const ProductDetails({super.key, required this.productInfo});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/cabbage.png",
      "name": "Cabbage",
      "weight": "1 kg",
      "newprice": 35.0,
      "oldprice": 40.0,
      "off": "12% Off"
    },
    {
      "image": "assets/images/carrot.png",
      "name": "Carrot",
      "weight": "1.5 kg",
      "newprice": 1.59,
      "oldprice": 1.99,
      "off": "20% Off"
    },
    {
      "image": "assets/images/cucumber.png",
      "name": "Cucumber",
      "weight": "2 kg",
      "newprice": 2.99,
      "oldprice": 3.49,
      "off": "14% Off"
    },
    {
      "image": "assets/images/green_peas.png",
      "name": "Green Peas",
      "weight": "0.5 kg",
      "newprice": 3.99,
      "oldprice": 4.99,
      "off": "20% Off"
    },
    {
      "image": "assets/images/onion.png",
      "name": "Onion",
      "weight": "0.75 kg",
      "newprice": 4.99,
      "oldprice": 5.99,
      "off": "17% Off"
    },
    {
      "image": "assets/images/tomato.png",
      "name": "Tomato",
      "weight": "5 kg",
      "newprice": 6.49,
      "oldprice": 7.99,
      "off": "18% Off"
    },
  ];

  final List<String> productImages = [
    'assets/images/tomato.png',
    'assets/images/onion.png', // Add your additional image assets
    'assets/images/tomato.png', // Add your additional image assets
  ];

  Future<void> bottomsheet(BuildContext context) {
    int count = 1; // Define count inside the function

    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Local setState
            return Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Cartpage()),
                      // );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Navigationpage(selectedIndex: 2), // Pass index 2
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 6, 93, 9),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "View Cart",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 7, 77, 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              // Use StatefulBuilder's setState
                              count++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$count", // Now updates in real-time!
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (count > 0) count--; // Prevent negative values
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  bool showInfo = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageCarousel(images: widget.productInfo["relevantImages"]),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 13),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                    color: Colors.grey,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productInfo["name"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            widget.productInfo["Quantity"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Text(
                                "Rs ${widget.productInfo["newPrice"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              Text(
                                "MRP ₹${widget.productInfo["oldPrice"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 1),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 147, 200, 243),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      offset: Offset(0, 5),
                                      blurRadius: 4,
                                      spreadRadius: 0.2,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "23 % Off",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 10, 20, 207),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.info(
                              message: 'Product added into cart',
                            ),
                          );
                          setState(() {
                            bottomsheet(context);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 2,
                                offset: Offset(0, 4),
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Column(
                    children: [
                      Row(
                        spacing: 14,
                        children: [
                          Text(
                            "View products details",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (showInfo) {
                                  showInfo = false;
                                  print(widget.productInfo["relevantImages"]);
                                } else {
                                  showInfo = true;
                                }
                              });
                            },
                            child: Icon(
                              !showInfo
                                  ? Icons.arrow_drop_up_rounded
                                  : Icons.arrow_drop_down_circle,
                              color: Colors.green,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      Text(showInfo ? "" : widget.productInfo["description"])
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailsContainer(
                          "assets/images/fresh.png", "Sourced", "Fresh Daily"),
                      DetailsContainer(
                          "assets/images/quality.png", "Quality", "Assured"),
                      DetailsContainer("assets/images/replacement.png",
                          "48 Hours", "Replacement"),
                      DetailsContainer(
                          "assets/images/delivery.png", "Fast", "Delivery"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Products in this Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          products[index]['image'],
                          products[index]['name'],
                          products[index]['weight'],
                          products[index]['newprice'],
                          products[index]['oldprice'],
                          products[index]['off'],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                color: const Color.fromARGB(255, 240, 255, 240),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/more.png',
                    width: 45,
                  ),
                  Text(
                    "See All Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    color: Colors.green,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  Widget ProductCard(String image, String name, String weight, double newprice,
      double oldprice, String off) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            // height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  weight,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 147, 200, 243),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    off,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 10, 20, 207),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "₹${newprice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "₹${oldprice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget DetailsContainer(String icon, String text1, String text2) {
    return Container(
      width: 89,
      height: 110,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: const Color.fromARGB(255, 240, 255, 240),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(icon, width: 40, height: 40),
          SizedBox(height: 6),
          Text(
            text1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;

  const ProductImageCarousel({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.4;

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.images[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 45,
          left: 10,
          right: 10,
          child: Row(
            children: [
              _buildCircleWithIcon(Icons.arrow_back, () {
                Navigator.pop(context);
              }),
              const Spacer(),
              _buildCircleWithIcon(Icons.upload, () {}),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color.fromARGB(255, 13, 95, 15)
                      : Colors.green.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleWithIcon(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
