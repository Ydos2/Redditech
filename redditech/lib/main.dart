import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:math' as math;
import 'dart:math' as math;
import 'dart:math' as math;
import 'dart:math' as math;
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.red),
        //home: const MyHomePage(title: 'Redditech'),
        home: Scaffold(
          body: ListView(
            children: [ConnectWidget()],
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ConnectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ConnectWidget - FRAME
    return Container(
        width: 349.2566833496094,
        height: 785.8275146484375,
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
              left: 1,
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
                        top: 8,
                        left: 44,
                        child: Text(
                          'Redditech',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(254, 58, 48, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 48,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
          Positioned(
              top: 478,
              left: 0,
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
              left: 69,
              child: Container(
                  width: 213.75001525878906,
                  height: 70.41000366210938,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.062499046325684),
                              topRight: Radius.circular(14.062499046325684),
                              bottomLeft: Radius.circular(14.062499046325684),
                              bottomRight: Radius.circular(14.062499046325684),
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
                              horizontal: 153, vertical: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Connection',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'DM Sans',
                                    fontSize: 13.03891658782959,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1.4285714285714286),
                              ),
                            ],
                          ),
                        )),
                  ]))),
          Positioned(
              top: 250,
              left: 25,
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
                          fontWeight: FontWeight.normal,
                          height: 1.3333333333333333),
                    ),
                    SizedBox(height: 9.313511848449707),
                    Transform.rotate(
                      angle: -1.8957001760364927e-31 * (math.pi / 180),
                      child: Text(
                        'IDR 1.500.000',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(254, 58, 48, 1),
                            fontFamily: 'DM Sans',
                            fontSize: 14.901618957519531,
                            letterSpacing: 0.18627023696899414,
                            fontWeight: FontWeight.normal,
                            height: 1.25),
                      ),
                    ),
                    SizedBox(height: 9.313511848449707),
                    Container(
                        width: 0,
                        height: 0,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                              width: 13.03891658782959,
                                              height: 13.03891658782959,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              ),
                                              child: Stack(children: <Widget>[
                                                Positioned(
                                                    top: 1.0865509510040283,
                                                    left: 1.0865954160690308,
                                                    child: Transform.rotate(
                                                      angle:
                                                          -1.8957001760364927e-31 *
                                                              (math.pi / 180),
                                                      /*child: SvgPicture.asset(
        'assets/images/vector.svg',
        semanticsLabel: 'vector'
      )*/
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Image(
                                                              image: AssetImage(
                                                                  "vector.svg"))
                                                        ],
                                                      ),
                                                    )),
                                              ])),
                                          SizedBox(width: 2.794053554534912),
                                          Transform.rotate(
                                            angle: -1.8957001760364927e-31 *
                                                (math.pi / 180),
                                            child: Text(
                                              '4.6',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 26, 48, 1),
                                                  fontFamily: 'DM Sans',
                                                  fontSize: 13.03891658782959,
                                                  letterSpacing:
                                                      0.18627023696899414,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 9.313511848449707),
                                    Transform.rotate(
                                      angle: -1.8957001760364927e-31 *
                                          (math.pi / 180),
                                      child: Text(
                                        '86 Reviews',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(12, 26, 48, 1),
                                            fontFamily: 'DM Sans',
                                            fontSize: 13.03891658782959,
                                            letterSpacing: 0.18627023696899414,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(9.313511848449707),
                                    topRight:
                                        Radius.circular(9.313511848449707),
                                    bottomLeft:
                                        Radius.circular(9.313511848449707),
                                    bottomRight:
                                        Radius.circular(9.313511848449707),
                                  ),
                                  color: Color.fromRGBO(238, 250, 246, 1),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 9.313511848449707,
                                    vertical: 1.8627023696899414),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Transform.rotate(
                                      angle: -1.8957001760364927e-31 *
                                          (math.pi / 180),
                                      child: Text(
                                        'Available : 250',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(58, 155, 122, 1),
                                            fontFamily: 'DM Sans',
                                            fontSize: 11.176214218139648,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ])),
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
