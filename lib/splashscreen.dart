// import 'package:ecom/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToHomeScreen();
//   }

//   _navigateToHomeScreen() {
//     Future.delayed(Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Homepage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Image.asset(
//               "assets/splashimage.jpeg",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             top: MediaQuery.of(context).size.height / 2.1,
//             right: MediaQuery.of(context).size.width / 3.5,
//             child: Text(
//               "My Shop",
//               style: GoogleFonts.dancingScript(
//                 textStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 48,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:ecom/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _State();
}

class _State extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToHomeScreen();
    });
  }

  _navigateToHomeScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Landingpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
        child: Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/splashimage.jpeg",
                fit: BoxFit.fitHeight,
              )),
          // Positioned(
          //     bottom: 100,
          //     left: 120,
          //     child: Text(
          //       "Secure Guard",
          //       style: TextStyle(
          //           fontSize: 36,
          //           fontWeight: FontWeight.w700,
          //           color: Colors.white),
          //     ))

          //  Positioned(
          //   top: MediaQuery.of(context).size.height / 2.1,
          //   right: MediaQuery.of(context).size.width / 3.5,
          //   child: Text(
          //     "My Shop",
          //     style: GoogleFonts.dancingScript(
          //       textStyle: TextStyle(
          //         color: Colors.white,
          //         fontSize: 48,
          //         fontWeight: FontWeight.w900,
          //       ),
          //     ),
          //   ),
          //  ),
        ]),
      ),
    );
  }
}
