import 'package:flutter/material.dart';
import 'package:qibla_finder/Constants/colors.dart';
import 'package:qibla_finder/Constants/images.dart';

import 'home_screen.dart';

class QiblaFinder extends StatefulWidget {
  const QiblaFinder({super.key});

  @override
  State<QiblaFinder> createState() => _QiblaFinderState();
}

class _QiblaFinderState extends State<QiblaFinder> {
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
            color: AppColors.blueColor,
            height: 200,
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome to Qibla",
            style: TextStyle(
              fontSize: 25,
              color: AppColors.blueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Direction App",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.greyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Container(
              height: 55,
              width: 170,
              decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
