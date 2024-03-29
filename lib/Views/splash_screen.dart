import 'dart:async';
import 'package:drugboxappv1/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: HomeController(),
                type: PageTransitionType.leftToRightWithFade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 400,
              child: Lottie.asset("assets/Animations/medicine-pills.json"),
            ),
            RichText(
                text: TextSpan(
                    text: "Drug",
                    style: TextStyle(
                      fontSize: 56.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF43A047),
                    ),
                    children: <TextSpan>[
                  TextSpan(
                    text: 'Box',
                    style: TextStyle(
                        fontSize: 56.0,
                        fontWeight: FontWeight.bold,
                        color:Color(0xFF76C5D3)),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
