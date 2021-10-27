import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

void main() {
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static double coverHeight = 180;
  static double profileHeight = 144;
  static double top = coverHeight - profileHeight / 2;
  static double bottom = profileHeight / 2;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    Scaffold(
        // List defilement
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[],
    )),

// --------------------------------------
    Column(
      children: <Widget>[
        Text("Index 1: History", style: optionStyle),
        FlutterLogo(),
      ],
    ),

// --------------------------------------
    Column(
      children: <Widget>[
        Text(
          "Index 2: Challenges",
          style: optionStyle,
        ),
        FlutterLogo(),
      ],
    ),

// --------------------------------------
// Front
    Scaffold(
        // List defilement
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Background image
            Container(
              color: Colors.grey,
              margin: EdgeInsets.only(bottom: bottom),
              child: Image.network(
                'https://styles.redditmedia.com/t5_i703r/styles/profileBanner_vbsd6d5xelv51.jpg?width=1280&height=384&crop=1280:384,smart&s=8954ada843a7e6ed9827a5f41ca235d448fd1d6d',
                width: double.infinity,
                height: coverHeight,
                fit: BoxFit.cover,
              ),
            ),
            // Icone image
            Positioned(
              top: top,
              child: CircleAvatar(
                radius: profileHeight / 2,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    'https://i.redd.it/snoovatar/avatars/1c38f7a0-cb34-4357-8d68-5b33d18d4c26.png'),
              ),
            )
          ],
        ),
// Bottom
        Column(
          children: [
            Text(
              'Alexandre Flion',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              'Software Engineer',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 16),
            // Line of divide
            Divider(),
            const SizedBox(height: 16),
            Text(
              'About',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            Text(
              'Web and native application developer, I am available for any work using flutter.\nI am coming from Epitech school and I am in my 3rd year.',
              style: TextStyle(fontSize: 18, height: 1.4),
            ),
          ],
        ),
      ],
    ))
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Subreddit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[500],
        unselectedItemColor: Colors.grey[500],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomepageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator HomepageWidget - FRAME
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
              top: 117,
              left: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                        offset: Offset(0, 20),
                        blurRadius: 60)
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
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
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Ellipse1.png'),
                                          fit: BoxFit.fitWidth),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(50, 50)),
                                    )),
                                SizedBox(width: 18),
                                Container(
                                  decoration: BoxDecoration(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Unity3D',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 18,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/Ellipse2.png'),
                                                      fit: BoxFit.fitWidth),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.elliptical(
                                                              20, 20)),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Published by u/lol . 1 mois',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                142, 142, 142, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'This is the original component. Edit me to make global changes to all.\nNew edit mode so nice !!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.5 /*PERCENT not supported*/
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 53),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(width: 10),
                          Text(
                            '4',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                          SizedBox(width: 10),
                          Text(
                            '1',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                          SizedBox(width: 10),
                          Text(
                            '2',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 316,
              left: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                        offset: Offset(0, 20),
                        blurRadius: 60)
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
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
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Ellipse1.png'),
                                          fit: BoxFit.fitWidth),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(50, 50)),
                                    )),
                                SizedBox(width: 18),
                                Container(
                                  decoration: BoxDecoration(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Unity3D',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 18,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/Ellipse2.png'),
                                                      fit: BoxFit.fitWidth),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.elliptical(
                                                              20, 20)),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Published by u/lol . 1 mois',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                142, 142, 142, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'This is the original component. Edit me to make global changes to all.\nNew edit mode so nice !!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.5 /*PERCENT not supported*/
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 53),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(width: 10),
                          Text(
                            '4',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                          SizedBox(width: 10),
                          Text(
                            '1',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                          SizedBox(width: 10),
                          Text(
                            '2',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 515,
              left: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                        offset: Offset(0, 20),
                        blurRadius: 60)
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
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
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Ellipse1.png'),
                                          fit: BoxFit.fitWidth),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(50, 50)),
                                    )),
                                SizedBox(width: 18),
                                Container(
                                  decoration: BoxDecoration(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Unity3D',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 18,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/Ellipse2.png'),
                                                      fit: BoxFit.fitWidth),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.elliptical(
                                                              20, 20)),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Published by u/lol . 1 mois',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                142, 142, 142, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'This is the original component. Edit me to make global changes to all.\nNew edit mode so nice !!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.5 /*PERCENT not supported*/
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 53),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(width: 10),
                          Text(
                            '4',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                          SizedBox(width: 10),
                          Text(
                            '1',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                          SizedBox(width: 10),
                          Text(
                            '2',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(142, 142, 142, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 52,
              left: 24.274658203125,
              child: Container(
                  width: 302.56805419921875,
                  height: 46.54893112182617,
                  decoration: BoxDecoration(),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13.097126007080078),
                              topRight: Radius.circular(13.097126007080078),
                              bottomLeft: Radius.circular(13.097126007080078),
                              bottomRight: Radius.circular(13.097126007080078),
                            ),
                            color: Color.fromRGBO(250, 250, 250, 1),
                            border: Border.all(
                              color: Color.fromRGBO(237, 237, 237, 1),
                              width: 0.9309785962104797,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.61957359313965,
                              vertical: 14.895657539367676),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Search Product Name',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(196, 197, 196, 1),
                                    fontFamily: 'DM Sans',
                                    fontSize: 13.033700942993164,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1.2857143275256449),
                              ),
                              SizedBox(width: 9.309786796569824),
                            ],
                          ),
                        )),
                  ]))),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 349.1169738769531,
                  height: 40.96305847167969,
                  child: Stack(children: <Widget>[]))),
          Positioned(
              top: 729.9464721679688,
              left: -0.000026500099920667708,
              child: Container(
                  width: 349.1169738769531,
                  height: 55.85871505737305,
                  decoration: BoxDecoration(),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 349.1169738769531,
                            height: 55.85871505737305,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.05000000074505806),
                                    offset: Offset(0, -0.9309785962104797),
                                    blurRadius: 3.723914384841919)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 87.27924346923828,
                            height: 55.85871505737305,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.05000000074505806),
                                    offset: Offset(0, -0.9309785962104797),
                                    blurRadius: 3.723914384841919)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Positioned(
                        top: 9.309785842895508,
                        left: 32.584251403808594,
                        child: Container(
                            width: 22.343486785888672,
                            height: 22.343486785888672,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0.0000020265579223632812,
                                  left: 2.3274383544921875,
                                  child: Container(
                                      width: 20.01603889465332,
                                      height: 20.481529235839844,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0.0000020265579223632812,
                                            left: 5.120367050170898,
                                            child: Container(
                                                width: 14.895657539367676,
                                                height: 14.895657539367676,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        9.309785842895508),
                                                    topRight: Radius.circular(
                                                        9.309785842895508),
                                                    bottomLeft: Radius.circular(
                                                        9.309785842895508),
                                                    bottomRight:
                                                        Radius.circular(
                                                            9.309785842895508),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      239, 245, 251, 0),
                                                ))),
                                      ]))),
                            ]))),
                    Positioned(
                        top: 0,
                        left: 87.51193237304688,
                        child: Container(
                            width: 87.27925109863281,
                            height: 55.85871505737305,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.05000000074505806),
                                    offset: Offset(0, -0.9309785962104797),
                                    blurRadius: 3.723914384841919)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Positioned(
                        top: 0,
                        left: 175.02398681640625,
                        child: Container(
                            width: 87.27925872802734,
                            height: 55.85871505737305,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.05000000074505806),
                                    offset: Offset(0, -0.9309785962104797),
                                    blurRadius: 3.723914384841919)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Positioned(
                        top: 32.584251403808594,
                        left: 205.95333862304688,
                        child: Text(
                          'Post',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(12, 26, 48, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 9.309785842895508,
                              letterSpacing: 0.1861957162618637,
                              fontWeight: FontWeight.normal,
                              height: 2),
                        )),
                    Positioned(
                        top: 0,
                        left: 261.60491943359375,
                        child: Container(
                            width: 87.27924346923828,
                            height: 55.85871505737305,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.05000000074505806),
                                    offset: Offset(0, -0.9309785962104797),
                                    blurRadius: 3.723914384841919)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Positioned(
                        top: 9.309757232666016,
                        left: 294.189208984375,
                        child: Container(
                            width: 22.343486785888672,
                            height: 22.343486785888672,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.619571685791016),
                                topRight: Radius.circular(18.619571685791016),
                                bottomLeft: Radius.circular(18.619571685791016),
                                bottomRight:
                                    Radius.circular(18.619571685791016),
                              ),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/Image1460.png'),
                                  fit: BoxFit.fitWidth),
                            ))),
                    Positioned(
                        top: 32.584251403808594,
                        left: 282.0865173339844,
                        child: Text(
                          'ACCOUNT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(12, 26, 48, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 9.309785842895508,
                              letterSpacing: 0.1861957162618637,
                              fontWeight: FontWeight.normal,
                              height: 2),
                        )),
                    Positioned(
                        top: 33.05352783203125,
                        left: 30,
                        child: Text(
                          'HOME',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(222, 40, 40, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 9.309785842895508,
                              letterSpacing: 0.1861957162618637,
                              fontWeight: FontWeight.normal,
                              height: 2),
                        )),
                    Positioned(
                        top: 32.584251403808594,
                        left: 105.85547637939453,
                        child: Text(
                          'subreddit ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(12, 26, 48, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 9.309785842895508,
                              letterSpacing: 0.1861957162618637,
                              fontWeight: FontWeight.normal,
                              height: 2),
                        )),
                  ]))),
        ]));
  }
}
