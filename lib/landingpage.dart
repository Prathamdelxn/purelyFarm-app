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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.02),
          Image.asset(
            "assets/image.png",
            width: size.width,
            height: size.height * 0.45,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: size.height * 0.05,
                    left: size.width * 0.1,
                    child: Container(
                      height: size.height * 0.41,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.065,
                    left: size.width * 0.15,
                    child: SizedBox(
                      width: size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/Broccoli.png"),
                          Image.asset("assets/Pineapple.png"),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.09,
                    left: size.width * 0.15,
                    child: SizedBox(
                      width: size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/Strawberry.png"),
                          Image.asset("assets/Carrot.png"),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // top: size.height * 0.01,
                    left: size.width * 0.379,
                    child: Container(
                      height: size.height * 0.12,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: Center(
                        child: Image.asset("assets/Healthy food.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.15,
                    left: size.width * 0.2,
                    child: SizedBox(
                      width: size.width * 0.6,
                      child: Column(
                        children: [
                          Text(
                            "Quick Delivery At Your Door Step",
                            style: TextStyle(
                              fontSize: size.width * 0.065,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            "Your Parcel , Our Priority",
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: size.height * 0.07,
                              width: size.width * 0.45,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 27, 102, 29),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.05,
                                  ),
                                ),
                              ),
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
        ],
      ),
    );
  }
}

// import 'package:ecom/authentication/login.dart';
// import 'package:flutter/material.dart';

// class Landingpage extends StatefulWidget {
//   const Landingpage({super.key});

//   @override
//   State<Landingpage> createState() => _LandingpageState();
// }

// class _LandingpageState extends State<Landingpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         padding: EdgeInsets.only(top: 28),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           children: [
//             Image.asset(
//               "assets/image.png",
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.45,
//               fit: BoxFit.contain,
//             ),
//             Expanded(
//               child: SizedBox(
//                 height: 400,
//                 width: 380,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                         top: 50,
//                         left: 30,
//                         child: Container(
//                           height: 380,
//                           width: 330,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.grey,
//                           ),
//                         )),
//                     Positioned(
//                         top: 65,
//                         left: 55,
//                         child: Container(
//                           width: 290,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Image.asset("assets/Broccoli.png"),
//                               Image.asset("assets/Pineapple.png"),
//                             ],
//                           ),
//                         )),
//                     Positioned(
//                         bottom: 35,
//                         left: 55,
//                         child: Container(
//                           width: 290,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Image.asset("assets/Strawberry.png"),
//                               Image.asset("assets/Carrot.png"),
//                             ],
//                           ),
//                         )),
//                     Positioned(
//                       top: 0,
//                       left: 140,
//                       child: Container(
//                         height: 100,
//                         width: 100,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(70)),
//                         child: Center(
//                           child: Image.asset("assets/Healthy food.png"),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 130,
//                       left: 70,
//                       child: Container(
//                         width: 240,
//                         child: Column(
//                           children: [
//                             Text(
//                               "Quick Delivery At Your Door Step",
//                               style: TextStyle(
//                                   fontSize: 30, fontWeight: FontWeight.w600),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               "Your Parcel , Our Priority",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w600),
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => LoginPage()));
//                               },
//                               child: Container(
//                                 height: 55,
//                                 width: 180,
//                                 decoration: BoxDecoration(
//                                     color:
//                                         const Color.fromARGB(255, 27, 102, 29),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Center(
//                                   child: Text(
//                                     "Get Started",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 18),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
