import 'package:ecom/screens/productDetails.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

class Categoriesdetails extends StatefulWidget {
  final categoryName;
  final List<Map> arrayodproduct;
  const Categoriesdetails(
      {super.key, required this.categoryName, required this.arrayodproduct});

  @override
  State<Categoriesdetails> createState() => _CategoriesdetailsState();
}

class _CategoriesdetailsState extends State<Categoriesdetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  final List<Map<String, String>> cardsDataProducts = [
    {
      "image": "https://static.toiimg.com/photo/105672842.cms",
      "name": "Carrot",
      "newPrice": "50",
      "Quantity": "500 gm",
      "oldPrice": "80",
    },
    {
      "image":
          "https://st2.depositphotos.com/1030113/10488/i/450/depositphotos_104882238-stock-photo-ripe-tomato-cluster-in-greenhouse.jpg",
      "name": "Tomato",
      "newPrice": "40",
      "Quantity": "250 gm",
      "oldPrice": "60",
    },
    {
      "image":
          "https://media.istockphoto.com/id/535910387/photo/ripe-organic-green-salad-romano.jpg?s=612x612&w=0&k=20&c=9GTcj_WqUk9LWkzUb6g4MCnLTPAapT_hNMZCHRd3C1U=",
      "name": "Lettuce",
      "newPrice": "30",
      "Quantity": "1 Kg",
      "oldPrice": "50",
    },
    {
      "image":
          "https://cdn.create.vista.com/api/media/small/86610186/stock-photo-fresh-raw-organic-broccoli-in-bowl-closeup",
      "name": "Broccoli",
      "newPrice": "120",
      "Quantity": "2 Kg",
      "oldPrice": "220",
    },
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1675365779531-031dfdcdf947?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cG90YXRvfGVufDB8fDB8fHww",
      "name": "Potato",
      "newPrice": "20",
      "Quantity": "100 gm",
      "oldPrice": "35",
    },
    {
      "image":
          "https://media.istockphoto.com/id/492528037/photo/fresh-kohlrabi-on-the-wooden-table-closeup.jpg?s=612x612&w=0&k=20&c=5aaWZ5sG-fd2nWvGSdywmNsFNzS74HF4eL8f2vUzPfw=",
      "name": "Kohlrabi",
      "newPrice": "45",
      "Quantity": "500 gm",
      "oldPrice": "70",
    },
    {
      "image":
          "https://5.imimg.com/data5/FL/HY/QP/SELLER-90465243/artichoke.jpeg",
      "name": "Artichoke",
      "newPrice": "75",
      "Quantity": "750 gm",
      "oldPrice": "100",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0TLQ-TatGslPnS8LwNMnQzkymUZI3Q-_-gw&s",
      "name": "Spinach",
      "newPrice": "25",
      "Quantity": "500 gm",
      "oldPrice": "40",
    },
    {
      "image":
          "https://images.pexels.com/photos/2329440/pexels-photo-2329440.jpeg",
      "name": "Cucumber",
      "newPrice": "35",
      "Quantity": "1 Kg",
      "oldPrice": "55",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTpxkGAiIHrq6vQTIHBnnqLvT-B5p3Ar421w&s",
      "name": "Bell Pepper",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
    },
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(Duration(milliseconds: 200), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/categoriesImg/vegetablesImage/Broccoli (1).png",
                      height: 50,
                    ),
                    SizedBox(width: 20),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: Text(
                        widget.categoryName!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 234, 234),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        width: 380,
                        height: 60,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(9, 30, 66, 0.25),
                              blurRadius: 8,
                              spreadRadius: -2,
                              offset: Offset(0, 4),
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(9, 30, 66, 0.08),
                              blurRadius: 0,
                              spreadRadius: 1,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      "Search ${widget.categoryName} Here",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.search),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 179, 179, 179),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sort by",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 69, 68, 68),
                                      ),
                                    ),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 167, 166, 166),
                              ),
                              child: Center(
                                child: Text(
                                  "Filter",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(255, 54, 53, 53),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 items per row
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.78, // Adjust height of boxes
                          ),
                          itemCount: widget.arrayodproduct
                              .length, // Change this based on your data
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                print(widget.arrayodproduct[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                              productInfo:
                                                  widget.arrayodproduct[index],
                                            )));
                              },
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 140,
                                        width: double.infinity,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 123, 123, 121),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                        child: Image.network(
                                          widget.arrayodproduct[index]
                                              ["image"]!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        widget.arrayodproduct[index]["name"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                      // Text("⭐ ⭐ ⭐ ⭐ ⭐"),
                                      Text(
                                        widget.arrayodproduct[index]
                                            ["Quantity"]!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 40,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Rs ${widget.arrayodproduct[index]["newPrice"]!}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  widget.arrayodproduct[index]
                                                      ["oldPrice"]!,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: Colors.white,
                                    ))
                              ]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
