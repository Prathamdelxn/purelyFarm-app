import 'package:ecom/authentication/login.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 28),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset(
              "assets/image.png",
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: 440,
              width: 380,
              child: Stack(
                children: [
                  Positioned(
                      top: 50,
                      left: 30,
                      child: Container(
                        height: 380,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                      )),
                  Positioned(
                      top: 65,
                      left: 55,
                      child: Container(
                        width: 290,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/Broccoli.png"),
                            Image.asset("assets/Pineapple.png"),
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 35,
                      left: 55,
                      child: Container(
                        width: 290,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/Strawberry.png"),
                            Image.asset("assets/Carrot.png"),
                          ],
                        ),
                      )),
                  Positioned(
                    top: 0,
                    left: 140,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Image.asset("assets/Healthy food.png"),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(70)),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 70,
                    child: Container(
                      width: 240,
                      child: Column(
                        children: [
                          Text(
                            "Quick Delivery At Your Door Step",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Your Parcel , Our Priority",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Container(
                              height: 55,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 27, 102, 29),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
