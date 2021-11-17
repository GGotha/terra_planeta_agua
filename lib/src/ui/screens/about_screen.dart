import 'package:flutter/material.dart';
import 'package:terra_planeta_agua/src/colors.dart';
import 'package:terra_planeta_agua/src/ui/widgets/custom_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ONGBlueColor,
      appBar: CustomAppBar(
        hasLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Center(
              child: Text(
                'Terra, planeta Água',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
          ),
          SizedBox(height: 60),
          Container(
            child: Image(
              width: 250,
              image: AssetImage('assets/images/desenho.png'),
            ),
          ),
          SizedBox(height: 80),
          Container(
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
            width: double.infinity,
            child: Center(
              child: Text(
                'A ONG "Terra, planeta Água" desenvolveu um sistema para mensuração de parâmetros químicos, físicos e biológicos do oceano, a partir da recepção, armazenamento e classificação das informações coletadas por centenas de sensores instalados ao longo da costa brasileira.',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
