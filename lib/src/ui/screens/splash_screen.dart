import 'package:flutter/material.dart';
import 'package:terra_planeta_agua/src/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 1500),
      () {
        Navigator.pushReplacementNamed(context, '/login');
      },
    );

    return Scaffold(
      backgroundColor: ONGBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: Image(
                      image: AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Terra, planeta Água',
                  style: TextStyle(
                    color: ONGGreenColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
