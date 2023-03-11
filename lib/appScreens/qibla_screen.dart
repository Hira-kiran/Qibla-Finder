import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:qibla_finder/Constants/colors.dart';
import 'package:qibla_finder/Constants/images.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double? begin = 0.0;

class _QiblaScreenState extends State<QiblaScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.blueColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Text(
          "Qibla Finder",
          style: TextStyle(
            fontSize: 25,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FlutterQiblah.qiblahStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColors.blueColor,
                      ));
                    }
                    final qiblaDirection = snapshot.data;
                    animation = Tween(
                            begin: begin,
                            end: (qiblaDirection!.qiblah * (pi / 180) * -1))
                        .animate(_animationController!);
                    begin = (qiblaDirection.qiblah * (pi / 180) * -1);
                    _animationController!.forward(from: 0);

                    return SizedBox(
                      child: AnimatedBuilder(
                          animation: animation!,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: animation!.value,
                              child: Center(
                                  child: Image.asset(
                                ImagesAssets.qiblaImage,
                                height: 300,
                              )),
                            );
                          }),
                    );
                  }),
            ),
            Text(
              textAlign: TextAlign.center,
              "Hold your phone parrallel to the ground and set your direction to the arrow mark as it point to kabaa.",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.greyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
