import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {

            const begin = Offset(0.0, 1.0); 
            const end = Offset.zero;
            const curve = Curves.ease; 

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

         
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
