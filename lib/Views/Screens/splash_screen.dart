import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:departure_vm/Views/Screens/home_page.dart';
import 'package:flutter/material.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 400,
      splash: Column(
        children: [
          Text(
            '''_धर्म एव हतो हन्ति धर्मो रक्षति रक्षितः\n
तस्माद्धर्मो न हन्तव्यो मा नो धर्मो हतोऽवधीत् ॥''',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/vasudev.jpg',
            ),
          ),
        ],
      ),
      nextScreen: HomePage(),
      animationDuration: Duration(seconds: 5),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
