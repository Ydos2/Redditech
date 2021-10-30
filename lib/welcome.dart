/**
 * @file main.dart
 * Main page with the login and connection
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redditech/auth.dart';

/**
 * Main function
 * Run the WelcomeScreen class
 */
void main() {
  runApp(WelcomeScreen());
}

/**
 * Welcome screen with front of page
 */
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Body(),
      ),
    );
  }
}

/**
 * Body of page
 */
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
                Text(
                  'Redditech',
                  style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(height: 16),
                // Line of divide
                Divider(),
                const SizedBox(height: 16),
                Text(
                  "Share, Create and Play",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.14),
                SvgPicture.asset(
                  "assets/images/reddit-4.svg",
                  height: size.height * 0.25,
                ),
                SizedBox(height: size.height * 0.14),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: newElevatedButton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /**
   * newElevatedButton create a new login button
   * Return the Widget
   */
  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        "LOGIN",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: pressAction,
      style: ElevatedButton.styleFrom(
          primary: Colors.red.shade500,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: Colors.red.shade500,
              fontSize: 18,
              fontWeight: FontWeight.w500)),
    );
  }

  /**
   * Call action for the button
   */
  void pressAction() {
    runApp(const MaterialApp(home: TokenAsk()));
  }
}
