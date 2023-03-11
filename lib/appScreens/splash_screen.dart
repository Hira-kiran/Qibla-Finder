import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qibla_finder/Constants/images.dart';

import 'qibla_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        (() => Navigator.push(
            context, MaterialPageRoute(builder: (context) => QiblaScreen()))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            ImagesAssets.qiblaImageSplash,
            color: Color.fromARGB(255, 125, 125, 125),
            height: 200,
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome to Qibla Finder",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
