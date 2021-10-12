import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

void main() {
  runApp(MyAppp());
}

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [ConnectWidget()],
        ),
      ),
    );
  }
}

class ConnectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ConnectWidget - FRAME
    return Container(
        width: 349.2566833496094,
        height: 650.8275146484375,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.194252014160156),
            topRight: Radius.circular(26.194252014160156),
            bottomLeft: Radius.circular(26.194252014160156),
            bottomRight: Radius.circular(26.194252014160156),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                offset: Offset(0, 0),
                blurRadius: 218.28543090820312)
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 141,
              left: 32,
              child: Container(
                  width: 349,
                  height: 81,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                          offset: Offset(0, 0.9309785962104797),
                          blurRadius: 2.792936086654663)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 20,
                        left: 54,
                        child: Text(
                          'Redditech',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(254, 58, 48, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 48,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        )),
                  ]))),
          Positioned(
              top: 478,
              left: 30,
              child: Transform.rotate(
                angle: -2.38541615327952e-15 * (math.pi / 180),
                child: Container(
                    width: 349.0000305175781,
                    height: 121.00000762939453,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                            offset: Offset(0, -0.9309785962104797),
                            blurRadius: 3.723914384841919)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    )),
              )),
          Positioned(
              top: 504,
              left: 45,
              child: Container(
                  width: 320.75001525878906,
                  height: 70.41000366210938,
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      // Faire gaffe la
                      child: FlatButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13.097125053405762),
                              topRight: Radius.circular(13.097125053405762),
                              bottomLeft: Radius.circular(13.097125053405762),
                              bottomRight: Radius.circular(13.097125053405762),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.20000000298023224),
                                  offset: Offset(0, 2.794053554534912),
                                  blurRadius: 9.313511848449707)
                            ],
                            color: Color.fromRGBO(222, 39, 39, 1),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 142.49673461914062,
                              vertical: 13.970268249511719),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'DM Sans',
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3305016926356725),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ]))),
          Positioned(
              top: 250,
              left: 80,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Share, Create and Play',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(12, 26, 48, 1),
                          fontFamily: 'DM Sans',
                          fontSize: 22.352428436279297,
                          letterSpacing: 0.18627023696899414,
                          fontWeight: FontWeight.bold,
                          height: 1.3333333333333333),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 349.1169738769531,
                  height: 40.96305847167969,
                  child: Stack(children: <Widget>[]))),
        ]));
  }
}
