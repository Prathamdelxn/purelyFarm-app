import 'package:ecom/screens/addressAdd.dart';
import 'package:ecom/screens/paymentscreen.dart';
import 'package:ecom/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  int count = 1;
  int selectedAddressIndex = 0;
  List<Map<dynamic, dynamic>> addresses = [
    {
      "address": "Flat no. 201, Shree Classic Society, Behind Maratha Hotel, Narhegaon, Pune -41,",
      "label": "Home"
    },
    {
      "address": "Flat no. 502, Galaxy Apartment, MG Road, Pune - 411001",
      "label": "Work"
    },
  ];
  Future<void> openBottomsheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows dynamic height based on content
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Makes bottom sheet take only needed height
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Your Address :",
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddressPage(),
                                ));
                          },
                          child: SvgPicture.asset(
                            "assets/add-location.svg",
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Dynamic ListView

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                            shrinkWrap: true, // Ensures ListView takes only required space
                            physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                            itemCount: addresses.length, // Dynamic based on address list
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedAddressIndex = index; // Update selection
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.all(12),
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: selectedAddressIndex == index
                                          ? Colors.green // Highlight selected
                                          : Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.amber,
                                        ),
                                        child: Center(
                                          child: Text(
                                            addresses[index]["label"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Radio(
                                            value: index,
                                            groupValue: selectedAddressIndex,
                                            onChanged: (int? value) {
                                              setState(() {
                                                selectedAddressIndex = value!;
                                              });
                                            },
                                            activeColor: Colors.green, // Change selected color
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              addresses[index]["address"],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          //
                        ],
                      ),
                    ),
                    // SizedBox(height: 20),
                    // Continue Button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Paymentscreen()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 7, 77, 10),
                        ),
                        child: Center(
                          child: Text(
                            "Continue with this Address",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Cart Page",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 7, 77, 10),
        centerTitle: true,
      ),
      body: count == 0
          ? Container(
              child: Center(
                child: Container(
                    child: Column(
                  children: [
                    Image.asset(
                      "assets/cute.gif",
                      width: 310,
                    ),
                    Text(
                      "Cart is Empty",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                    ),
                  ],
                )),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 46,
                      decoration: BoxDecoration(color: const Color.fromARGB(255, 146, 239, 160), borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/coupon.png"),
                                Text(
                                  "View Coupons & Offers",
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // height: 293,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 146, 239, 160),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/delivery-truck 1.png"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Delivery in Same Day",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/cartimg.png"),
                                    Column(
                                      children: [
                                        Text(
                                          "Fruit Local",
                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                        ),
                                        Text(
                                          "500 gm",
                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  count++;
                                                });
                                              },
                                              child: Icon(Icons.add)),
                                          Text("$count"),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  count--;
                                                });
                                              },
                                              child: Icon(Icons.remove))
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "₹10",
                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                        ),
                                        Text(
                                          "₹50",
                                          style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          const MySeparator(
                            color: Colors.grey,
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(horizontal: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Missed Something ?",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  height: 30,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Add More Items",
                                        style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          Text(
                            "You might also like",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        // color: Colors.amber,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
                                    },
                                    child: Container(
                                      height: 230,
                                      width: 150,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromARGB(255, 146, 239, 160), border: Border.all(color: Colors.grey, width: 2)),
                                      child: Column(
                                        children: [
                                          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset("assets/images/fruits.png")),
                                          Text(
                                            "Special Fruits",
                                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                          ),
                                          Text(
                                            "500 gm",
                                            style: TextStyle(fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 108, 107, 107)),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "₹ 20",
                                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                " 50",
                                                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 18),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Container(
                                            height: 28,
                                            width: 120,
                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 18, 101, 21), borderRadius: BorderRadius.circular(5)),
                                            child: Center(
                                              child: Text(
                                                "Add to Cart",
                                                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            })),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        openBottomsheet(context);
                      },
                      child: Container(
                        height: 60,
                        margin: EdgeInsets.only(bottom: 100),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 7, 77, 10),
                        ),
                        child: Center(
                          child: Text(
                            "Add Address to Procced",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 2, this.color = Colors.black}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 9.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (1.3 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
