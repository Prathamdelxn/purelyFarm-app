// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(top: 50),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         color: const Color.fromARGB(255, 25, 100, 25),
//         child: Column(
//           children: [
//             Container(
//               height: 300,
//               width: 330,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset("assets/Vegetables.png"),
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Text(
//                         "Sign Up",
//                         style: TextStyle(
//                             fontSize: 30,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w900),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     "Your Seamless Expreience Begins with Professional Delivery",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                         fontSize: 16),
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 510,
//               width: 370,
//               padding: EdgeInsets.symmetric(horizontal: 26, vertical: 30),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(40)),
//               child: Column(
//                 children: [
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Name",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w700),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextField(
//                           cursorWidth: 2, // Adjust cursor width
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Custom border
//                               borderSide: BorderSide(
//                                 color: Colors.black, // Border color
//                                 width: 1.5, // Border width
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Border when TextField is focused
//                               borderSide: BorderSide(
//                                 color: Colors
//                                     .blue, // Change to any color when focused
//                                 width: 1.5,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Default border
//                               borderSide: BorderSide(
//                                 color: Colors.black,
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Email",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w700),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextField(
//                           cursorWidth: 2, // Adjust cursor width
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Custom border
//                               borderSide: BorderSide(
//                                 color: Colors.black, // Border color
//                                 width: 1.5, // Border width
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Border when TextField is focused
//                               borderSide: BorderSide(
//                                 color: Colors
//                                     .blue, // Change to any color when focused
//                                 width: 1.5,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Default border
//                               borderSide: BorderSide(
//                                 color: Colors.black,
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Password",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w700),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextField(
//                           cursorWidth: 2, // Adjust cursor width
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Custom border
//                               borderSide: BorderSide(
//                                 color: Colors.black, // Border color
//                                 width: 1.5, // Border width
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Border when TextField is focused
//                               borderSide: BorderSide(
//                                 color: Colors
//                                     .blue, // Change to any color when focused
//                                 width: 1.5,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                               // Default border
//                               borderSide: BorderSide(
//                                 color: Colors.black,
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     height: 50,
//                     width: 180,
//                     child: Center(
//                       child: Text("Sign up"),
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: const Color.fromARGB(255, 20, 110, 23),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomSheet: BottomSheet(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//               top: Radius.circular(70)), // Rounded top corners
//         ),
//         onClosing: () {}, // Required but not used
//         enableDrag: false, // Prevent user from dragging to close
//         builder: (context) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(70),
//             child: Container(
//               height: 200, // Adjust height as needed

//               child: Center(
//                 child: Text("This is a Bottom Sheet"),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }import 'package:ecom/CustomPageRoute.dart';
import 'package:ecom/CustomPageRoute.dart';
import 'package:ecom/authentication/otp.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      isScrollControlled:
          true, // Make sure the bottom sheet adjusts to content height
      enableDrag: false, // Prevent drag to close
      context: context,
      builder: (context) {
        // Get the keyboard height using MediaQuery
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

        // Dynamically adjust the bottom sheet height based on keyboard visibility
        double bottomSheetHeight = keyboardHeight > 0 ? 600.0 : 300.0;

        return Container(
          height:
              bottomSheetHeight, // Adjust height based on keyboard visibility
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mobile Number",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      cursorWidth: 2, // Adjust cursor width
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        prefixIcon: Icon(Icons.phone, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Close the bottom sheet before navigating to OTP page
                  Navigator.pop(context);
                  // Navigate to OTP page
                  Navigator.push(
                    context,
                    CustomPageRoute(child: OtpPage()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 9, 104, 34),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allows resizing when keyboard appears
      body: SingleChildScrollView(
        // Make the entire screen scrollable
        child: Container(
          padding: EdgeInsets.only(top: 50),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 45, 121, 123),
          child: Column(
            children: [
              SizedBox(height: 100),
              Container(
                height: 500,
                child: Image.asset(
                  "assets/illustration.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Text(
                "Your Seamless Experience Begins with Professional Delivery",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  showCustomBottomSheet(context);
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 102, 41),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Login Here",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
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
