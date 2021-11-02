import 'package:flutter/material.dart';
import 'package:redditech/Profile.dart';
import 'package:redditech/SettingClass.dart';
import 'package:redditech/tests_list.dart';
import 'package:redditech/subReddit.dart';

Profile USERPROFILE = Profile("", "", "", 0);
Settings USERSETTINGS = new Settings();
List<Post> postRand = [];
List<subReddit> mySubreddit = [];

const Color colorBlack = Colors.black;
const Color colorWhite = Colors.white;
const Color colorGrey = Colors.grey;
Color colorGreyHard = Colors.grey.shade900;

void main() {
  runApp(const MyApp());
}

Future getHomePage() async {
  USERSETTINGS.recover();
  mySubreddit = await getMySubscriptions();
  for (var i = 0; i < mySubreddit.length; i++) {
    mySubreddit[i].getInfo();
  }
  return postRand = await getRandomPosts(await getMySubscriptions());
}

Future<dynamic> callAsyncFetch() =>
    Future.delayed(Duration(seconds: 1), () => getHomePage());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return FutureBuilder<dynamic>(
        future: callAsyncFetch(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MyStatefulWidget(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
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

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    const HomeState(),

// --------------------------------------

    const SubredditState(),

// --------------------------------------
    Column(
      children: const <Widget>[
        Text(
          "Index 2: Challenges",
          style: optionStyle,
        ),
        FlutterLogo(),
      ],
    ),

// --------------------------------------
// Front
    const AccountState(),

// --------------------------------------
    SettingsState(),
  ];

  Future _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    firstRequest();

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: 'Subreddit',
            backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_circle_outline),
            label: 'Post',
            backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: 'Account',
            backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
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

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<HomeState> createState() => StatefulHome();
}

class StatefulHome extends State<HomeState> {
  static double coverHeight = 180;
  static double profileHeight = 144;
  static double top = coverHeight - profileHeight / 2;
  static double bottom = profileHeight / 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
        data: ThemeData(
          primaryColor: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
          appBarTheme: AppBarTheme(
            color: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
            textTheme: const TextTheme(
              headline1: TextStyle(
                color: colorGrey,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: const IconThemeData(color: colorGrey),
            actionsIconTheme: const IconThemeData(
              color: colorGrey,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
          // Bar Up
          appBar: AppBar(
            centerTitle: true,
            title: Text('Home',
                style: TextStyle(
                    color: USERSETTINGS.dark_mode ? colorWhite : colorBlack)),
            leading: const Icon(Icons.category),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: postRand.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(index);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          ),
        ),
      ),
    );
  }
}

class SubredditState extends StatefulWidget {
  const SubredditState({Key? key}) : super(key: key);

  @override
  State<SubredditState> createState() => StatefulSubreddit();
}

class StatefulSubreddit extends State<SubredditState> {
  static double coverHeight = 180;
  static double profileHeight = 144;
  static double top = coverHeight - profileHeight / 2;
  static double bottom = profileHeight / 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
        data: ThemeData(
          primaryColor: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
          appBarTheme: AppBarTheme(
            color: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
            textTheme: const TextTheme(
              headline1: TextStyle(
                color: colorGrey,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: const IconThemeData(color: colorGrey),
            actionsIconTheme: const IconThemeData(
              color: colorGrey,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
          // Bar Up
          appBar: AppBar(
            centerTitle: true,
            title: Text('Home',
                style: TextStyle(
                    color: USERSETTINGS.dark_mode ? colorWhite : colorBlack)),
            leading: const Icon(Icons.category),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: mySubreddit.length,
            itemBuilder: (context, index) {
              return _buildSubreddit(index, context);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          ),
        ),
      ),
    );
  }
}

class AccountState extends StatefulWidget {
  const AccountState({Key? key}) : super(key: key);

  @override
  State<AccountState> createState() => StatefulAccount();
}

class StatefulAccount extends State<AccountState> {
  static double coverHeight = 180;
  static double profileHeight = 144;
  static double top = coverHeight - profileHeight / 2;
  static double bottom = profileHeight / 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
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
                  color: colorGrey,
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
                      color: USERSETTINGS.dark_mode ? colorWhite : colorBlack),
                ),
                const SizedBox(height: 8),
                Text(
                  'Karma : ' + USERPROFILE.karma.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: USERSETTINGS.dark_mode ? colorWhite : colorBlack),
                ),
                const SizedBox(height: 16),
                // Line of divide
                const Divider(),
                const SizedBox(
                    height:
                        16), /*
            Text(
              'About',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorBlack),
            ),
            const SizedBox(height: 16),
            Text(
              'Web and native application developer, I am available for any work using flutter.\nI am coming from Epitech school and I am in my 3rd year.',
              style: TextStyle(fontSize: 18, height: 1.4),
            ),*/
              ],
            ),
          ],
        ));
  }
}

class SettingsState extends StatefulWidget {
  @override
  State<SettingsState> createState() => StatefulSettings();
}

class StatefulSettings extends State<SettingsState> {
  bool _hideDown = USERSETTINGS.hide_down;
  bool _hideUp = USERSETTINGS.hide_up;
  bool _email = USERSETTINGS.email_on_pm;
  bool _over = USERSETTINGS.is_adult;
  bool _nsfw = USERSETTINGS.show_nsfw;
  bool _dark = USERSETTINGS.dark_mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
      body: Container(
        child: DefaultTextStyle(
          style: TextStyle(
            color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                SwitchListTile(
                  title: Text(
                    "Hide down vote",
                    style: TextStyle(
                        fontSize: 18,
                        color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                        fontWeight: FontWeight.bold),
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
                  title: Text(
                    "Hide up vote",
                    style: TextStyle(
                        fontSize: 18,
                        color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                        fontWeight: FontWeight.bold),
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
                  title: Text(
                    "Send email on private message",
                    style: TextStyle(
                        fontSize: 18,
                        color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                        fontWeight: FontWeight.bold),
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
                  title: Text(
                    "Over 18",
                    style: TextStyle(
                        fontSize: 18,
                        color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                        fontWeight: FontWeight.bold),
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
                  title: Text(
                    "Show nsfw",
                    style: TextStyle(
                        fontSize: 18,
                        color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                        fontWeight: FontWeight.bold),
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
                  title: Text(
                    "Dark mode",
                    style: TextStyle(
                        fontSize: 18,
                        color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                        fontWeight: FontWeight.bold),
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
                  title: Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 18,
                        color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildArticleItem(int index) {
  final String sample = postRand[index].imageUrl.toString();
  int vote = 0;

  if (postRand[index].nsfw == true && USERSETTINGS.show_nsfw == false) {
    return Container();
  }
  return Container(
    color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
    child: Stack(
      children: <Widget>[
        Card(
          borderOnForeground: true,
          color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
          child: Container(
            color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(width: 20.0),
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              //"r/Unity3D",
                              "r/" + postRand[index].subReddit,
                              style: TextStyle(
                                color: USERSETTINGS.dark_mode
                                    ? colorWhite
                                    : colorBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              //"Publiée par u/Ydos * 10 mois",
                              postRand[index].author,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                // Image
                Text(
                  //"Blablabla dg,jisgpzgjzpogjzpojpz\nolsfkjzpgjpqzgjipoa^qzbripoa^bvniraop^bri\ndpsoqjpqvjpzdvkjpdvjpodvdvsbfs,kl dafspo",
                  postRand[index].subtext.toString(),
                  style: TextStyle(
                    color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                if (sample != "" && sample.isNotEmpty && sample != "default")
                  Image.network(
                    sample,
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  ),
                const SizedBox(height: 8),
                const Divider(),
                // Bottom button
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      child: const Icon(Icons.arrow_upward, color: colorGrey),
                      onPressed: () {
                        postRand[index].upvote(1);
                        vote = 1;
                      },
                    ),
                    Text(
                      //USERSETTINGS.hide_up ? 'Vote' : '42',
                      USERSETTINGS.hide_up
                          ? 'Vote'
                          : (postRand[index].upvotes + vote).toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: colorGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    if (USERSETTINGS.hide_down == false)
                      TextButton(
                        child:
                            const Icon(Icons.arrow_downward, color: colorGrey),
                        onPressed: () {
                          postRand[index].upvote(-1);
                          vote = -1;
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSubreddit(int index, BuildContext context) {
  String nbrSub = "";

  if (mySubreddit[index].nbSub > 1000000) {
    nbrSub = (mySubreddit[index].nbSub / 1000000).round().toString() + 'M';
  } else if (mySubreddit[index].nbSub > 1000) {
    nbrSub = (mySubreddit[index].nbSub / 1000).round().toString() + 'K';
  }

  return Container(
    color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
    child: Stack(
      children: <Widget>[
        TextButton(
          child: Card(
            borderOnForeground: true,
            color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
            child: Container(
              color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(width: 20.0),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor:
                            USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                        child: Image.network(
                          mySubreddit[index].imageUrl.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        //"r/Unity3D",
                        "r/" + mySubreddit[index].name,
                        style: TextStyle(
                          color:
                              USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        //"Publiée par u/Ydos * 10 mois",
                        nbrSub,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => SubredditPageState(
                          subreddit: mySubreddit[index],
                          //
                        )));
          },
        ),
      ],
    ),
  );
}

class SubredditPageState extends StatefulWidget {
  final subReddit subreddit;

  @override
  State<SubredditPageState> createState() => StatefulSubredditPage();
  const SubredditPageState({Key? key, required this.subreddit})
      : super(key: key);
}

class StatefulSubredditPage extends State<SubredditPageState> {
  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    subReddit subreddit = widget.subreddit;

    return Scaffold(
      backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
          onPressed: () {
            goBack(context);
          },
        ),
        toolbarHeight: 50,
        backgroundColor: USERSETTINGS.dark_mode ? colorBlack : colorWhite,
        title: Text("r/" + subreddit.name,
            style: TextStyle(
                color: USERSETTINGS.dark_mode ? colorWhite : colorBlack)),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: subreddit.posts.length,
        itemBuilder: (context, index) {
          return _buildArticleSubreddit(index, subreddit);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      ),
    );
  }
}

Widget _buildArticleSubreddit(int index, subReddit subreddit) {
  final String sample = subreddit.posts[index].imageUrl.toString();
  int vote = 0;

  if (subreddit.posts[index].nsfw == true && USERSETTINGS.show_nsfw == false) {
    return Container();
  }
  return Container(
    color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
    child: Stack(
      children: <Widget>[
        Card(
          borderOnForeground: true,
          color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
          child: Container(
            color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(width: 20.0),
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              //"r/Unity3D",
                              "r/" + subreddit.posts[index].subReddit,
                              style: TextStyle(
                                color: USERSETTINGS.dark_mode
                                    ? colorWhite
                                    : colorBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              //"Publiée par u/Ydos * 10 mois",
                              subreddit.posts[index].author,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                // Image
                Text(
                  //"Blablabla dg,jisgpzgjzpogjzpojpz\nolsfkjzpgjpqzgjipoa^qzbripoa^bvniraop^bri\ndpsoqjpqvjpzdvkjpdvjpodvdvsbfs,kl dafspo",
                  subreddit.posts[index].subtext.toString(),
                  style: TextStyle(
                    color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                if (sample != "" && sample.isNotEmpty && sample != "default")
                  Image.network(
                    sample,
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  ),
                const SizedBox(height: 8),
                const Divider(),
                // Bottom button
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      child: const Icon(Icons.arrow_upward, color: colorGrey),
                      onPressed: () {
                        subreddit.posts[index].upvote(1);
                        vote = 1;
                      },
                    ),
                    Text(
                      //USERSETTINGS.hide_up ? 'Vote' : '42',
                      USERSETTINGS.hide_up
                          ? 'Vote'
                          : (subreddit.posts[index].upvotes + vote).toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: colorGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    if (USERSETTINGS.hide_down == false)
                      TextButton(
                        child:
                            const Icon(Icons.arrow_downward, color: colorGrey),
                        onPressed: () {
                          subreddit.posts[index].upvote(-1);
                          vote = -1;
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
