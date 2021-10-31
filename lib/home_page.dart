import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:redditech/Profile.dart';
import 'package:redditech/SettingClass.dart';

Profile USERPROFILE = Profile("", "", "", 0);
Settings USERSETTINGS = new Settings();

void main() {
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    USERSETTINGS.recover();
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

  static String imageUrl = "";
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
                USERPROFILE.bannerUrl,
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
                backgroundImage: NetworkImage(USERPROFILE.imageUrl),
              ),
            )
          ],
        ),
// Bottom
        Column(
          children: [
            Text(
              USERPROFILE.username,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              'Karma : ' + USERPROFILE.karma.toString(),
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 16),
            // Line of divide
            Divider(),
            const SizedBox(
                height:
                    16), /*
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
            ),*/
          ],
        ),
      ],
    )),

// --------------------------------------
    Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: MyStatefulWi(),
          ),
        ),
      ),
    )
  ];

  Future _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    firstRequest();

    //print("im gonna put the " + imageUrl);
    //print("from the > " + USERPROFILE.imageUrl);
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
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[500],
        unselectedItemColor: Colors.grey[500],
        onTap: _onItemTapped,
      ),
    );
  }

  Future firstRequest() async {
    USERPROFILE = await getMyProfile();
  }
}

class MyStatefulWi extends StatefulWidget {
  @override
  State<MyStatefulWi> createState() => MyStateful();
}

class MyStateful extends State<MyStatefulWi> {
  bool _hideDown = USERSETTINGS.hide_down;
  bool _hideUp = USERSETTINGS.hide_up;
  bool _email = USERSETTINGS.email_on_pm;
  bool _over = USERSETTINGS.is_adult;
  bool _nsfw = USERSETTINGS.show_nsfw;
  bool _dark = USERSETTINGS.dark_mode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30.0),
        SwitchListTile(
          title: const Text(
            "Hide down vote",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "" + _hideDown.toString(),
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          value: _hideDown,
          onChanged: (val) {
            if (USERSETTINGS.hide_down == false)
              USERSETTINGS.hide_down = true;
            else
              USERSETTINGS.hide_down = false;
            USERSETTINGS.apply();
            setState(() {
              _hideDown = USERSETTINGS.hide_down;
            });
          },
        ),
        SwitchListTile(
          title: const Text(
            "Hide up vote",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "" + _hideUp.toString(),
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          value: _hideUp,
          onChanged: (bool value) {
            if (USERSETTINGS.hide_up == false)
              USERSETTINGS.hide_up = true;
            else
              USERSETTINGS.hide_up = false;
            USERSETTINGS.apply();
            setState(() {
              _hideUp = USERSETTINGS.hide_up;
            });
          },
        ),
        SwitchListTile(
          title: const Text(
            "Send email on private message",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "" + _email.toString(),
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          value: _email,
          onChanged: (val) {
            if (USERSETTINGS.email_on_pm == false)
              USERSETTINGS.email_on_pm = true;
            else
              USERSETTINGS.email_on_pm = false;
            USERSETTINGS.apply();
            setState(() {
              _email = USERSETTINGS.email_on_pm;
            });
          },
        ),
        SwitchListTile(
          title: const Text(
            "Over 18",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "" + _over.toString(),
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          value: _over,
          onChanged: (val) {
            if (USERSETTINGS.is_adult == false)
              USERSETTINGS.is_adult = true;
            else
              USERSETTINGS.is_adult = false;
            USERSETTINGS.apply();
            setState(() {
              _over = USERSETTINGS.is_adult;
            });
          },
        ),
        SwitchListTile(
          title: const Text(
            "Show nsfw",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "" + _nsfw.toString(),
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          value: _nsfw,
          onChanged: (val) {
            if (USERSETTINGS.show_nsfw == false)
              USERSETTINGS.show_nsfw = true;
            else
              USERSETTINGS.show_nsfw = false;
            USERSETTINGS.apply();
            setState(() {
              _nsfw = USERSETTINGS.show_nsfw;
            });
          },
        ),
        SwitchListTile(
          title: const Text(
            "Dark mode",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "" + _dark.toString(),
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          value: _dark,
          onChanged: (val) {
            if (USERSETTINGS.dark_mode == false)
              USERSETTINGS.dark_mode = true;
            else
              USERSETTINGS.dark_mode = false;
            USERSETTINGS.apply();
            setState(() {
              _dark = USERSETTINGS.dark_mode;
            });
          },
        ),
        ListTile(
          title: const Text(
            "Logout",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
