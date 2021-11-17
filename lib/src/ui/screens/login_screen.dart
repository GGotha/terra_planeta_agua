import 'package:flutter/material.dart';
import 'package:terra_planeta_agua/src/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ONGBlueColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 120,
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
            SizedBox(height: 20),
            Flexible(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: "",
                  labelText: "E-mail".toUpperCase(),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ONGGreenColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ONGGreenColor),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  counterText: "",
                  labelText: "Senha".toUpperCase(),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ONGGreenColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ONGGreenColor),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 40,
              child: RaisedButton(
                color: ONGGreenColor,
                child: Text(
                  'Conectar'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/report-screen",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
