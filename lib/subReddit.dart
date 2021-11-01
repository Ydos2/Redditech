import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'auth.dart';
import 'dart:math';

/** @brief This class is used to initialize the subReddit class
 *
 */
class Post {
  String title = "";
  String? subtext = "";
  String? imageUrl = "";
  String subReddit = "";
  String author = "";
  String subRedImg = "";
  String id = "";
  bool nsfw = false;
  int upvotes = 0;

  /** @brief Post constructor
   * @param title String containing the title of the post
   * @param subtext String that can be null, containing the subtext
   * @param image String that can be null, contain the URL a possible image in the post
   * @param sub String that contains the subreddit it has been posted on
   * @param poster String that contains the name of ther user that posted this
   * @param upvotes int, it is the numburs of upvotes (or downvotes) on the post
   * @param nsfw bool, true if the content is for adult
   * @param subRedditImg String, the subReddit img from where the post have been made
   * @param id String, it is the id of the post, used for the upvote
  */
  Post(String title, String? subtext, String? image, String sub, String poster, int upvotes, bool nsfw, String subRedImg, String id) {
    this.title = title;
    this.subtext = subtext;
    this.imageUrl = image;
    this.upvotes = upvotes;
    this.subReddit = sub;
    this.author = poster;
    this.nsfw = nsfw;
    this.subRedImg = subRedImg;
    this.id = id;
  }

  Future upvote(int request) async {
    if (request < -1 || request > 1)
      return;
  }
}

/** @brief subReddit class
 * This class is used to get the subreddits so you can see the posts from other people
 * all around the world !
 */

class subReddit {
  String name = "";
  String description = "";
  String imageUrl = "";
  String bannerUrl = "";
  int nbSub = 0;
  List<Post> posts = List.empty(growable: true);

  /** @brief subReddit constructor
   * @param name String, contains the name of the subReddit you want to pull informations from
   */
  subReddit(String name) {
    this.name = name;
  }

  void _extractPosts(Map<String, dynamic> jsonrsp) {
    for (int i = 0; i != jsonrsp["data"]["children"].length; i++) {
      var title = jsonrsp["data"]["children"][i]["data"]["title"];
      var text = jsonrsp["data"]["children"][i]["data"]["selftext"];
      var image = jsonrsp["data"]["children"][i]["data"]["thumbnail"];
      var upvotes = jsonrsp["data"]["children"][i]["data"]["ups"];
      var poster = jsonrsp["data"]["children"][i]["data"]["author"];
      var subreddit = jsonrsp["data"]["children"][i]["data"]["subreddit"];
      var nsfw = jsonrsp["data"]["children"][i]["data"]["over_18"];
      var id = jsonrsp["dada"]["children"][i]["data"]["name"];
      this.posts.add(new Post(title, text, image == "self" ? null : image, subreddit, poster, upvotes, nsfw, this.imageUrl, id));
    }
  }

  /** @brief get the informations of the subReddit
   * this function shall be awaited.
   * @return true of it succeed, false if the fetch failed (rare)
   */
  Future<bool> getInfo() async {
    var rsp = await http.get(Uri.parse("https://oauth.reddit.com/r/" + this.name + "/about"),
      headers: {"Authorization": "bearer " + getAuthToken(),
      },
    );
    if (rsp.statusCode == 200) {
      final jsonrsp = jsonDecode(rsp.body);
      this.imageUrl = jsonrsp["data"]["community_icon"];
      this.imageUrl = imageUrl.substring(0, imageUrl.indexOf("?"));
      this.description = jsonrsp["data"]["public_description"];
      this.bannerUrl = jsonrsp["data"]["banner_background_image"];
      this.bannerUrl = bannerUrl.substring(0, bannerUrl.indexOf("?"));
      this.nbSub = jsonrsp["data"]["subscribers"];
      return true;
    } else {
      print("Failed data search because i got: ");
      print(rsp.statusCode);
      print(rsp.body);
      return false;
    }
  }

  /** @brief Make the user unsubcribe to this subReddit
   * this function shall be awaited.
   */
  Future unsubscribe() async {
    await http.post(Uri.parse("https://oauth.reddit.com/api/subscribe?action=unsub&action_source=r&skip_initial_defaults=true&sr_name=" + this.name),
        headers: {"Authorization": "bearer " + getAuthToken(),
        "X-Modhash": "null",
        },
    );
  }

  /** @brief Make the user subcribe to this subReddit
   * this function shall be awaited.
   */
  Future subscribe() async {
      await http.post(Uri.parse("https://oauth.reddit.com/api/subscribe?action=sub&action_source=r&skip_initial_defaults=true&sr_name=" + this.name),
      headers: {"Authorization": "bearer " + getAuthToken(),
      "X-Modhash": "null",
      },
      );
  }

  /** @brief get the top post from this subReddit
   * automatically fills the "posts" List in the current object
   * this function shall be awaited.
   * @return true if it succeed, false it failed
   */
  Future<bool> getTop() async {
    final rsp = await http.get(
      Uri.parse('https://oauth.reddit.com/r/' + this.name + '/top.json'),
      headers: {"Authorization": "bearer " + getAuthToken(),
      },
    );
    if (rsp.statusCode == 200) {
      final jsonrsp = jsonDecode(rsp.body);
      _extractPosts(jsonrsp);
      return true;
    } else {
      print("Failed data search because i got: ");
      print(rsp.statusCode);
      print(rsp.body);
      return false;
    }
  }

  /** @brief get the new post from this subReddit
   * automatically fills the "posts" List in the current object
   * this function shall be awaited.
   * @return true if it succeed, false it failed
   */
  Future<bool> getNew() async {
    final rsp = await http.get(
      Uri.parse('https://oauth.reddit.com/r/' + this.name + '/new.json'),
      headers: {"Authorization": "bearer " + getAuthToken(),
      },
    );
    if (rsp.statusCode == 200) {
      final jsonrsp = jsonDecode(rsp.body);
      _extractPosts(jsonrsp);
      return true;
    } else {
      print("Failed data search because i got: ");
      print(rsp.statusCode);
      print(rsp.body);
      return false;
    }
  }

  /** @brief get the hot post from this subReddit
   * automatically fills the "posts" List in the current object
   * this function shall be awaited.
   * @return true if it succeed, false it failed
   */
  Future<bool> getHot() async {
    final rsp = await http.get(
      Uri.parse('https://oauth.reddit.com/r/' + this.name + '/hot.json'),
      headers: {"Authorization": "bearer " + getAuthToken(),
      },
    );
    if (rsp.statusCode == 200) {
      final jsonrsp = jsonDecode(rsp.body);
      _extractPosts(jsonrsp);
      return true;
    } else {
      print("Failed data search because i got: ");
      print(rsp.statusCode);
      print(rsp.body);
      return false;
    }
  }
}

/** @brief get random posts from the list of the subreddits provided
 * @param subs A list of subReddits that the posts should be fetched from
 * this function is usually called with getMySubscription() as parameter
 * this function shall be awaited.
 * @return a list of new posts randomly picked in the list of subReddit
 */
Future<List<Post>> getRandomPosts(List<subReddit> subs) async {
  List<Post> posts = List.empty(growable: true);
  Random random = new Random();

  if (subs.length == 0)
    return posts;
  for (int i = 0; i != subs.length; i++) {
    await subs[i].getHot();
  }

  for (int i = 0; i != 25; i++) {
        var idx = random.nextInt(subs.length);
        var curr = subs[idx];
        if (i <= curr.posts.length) {
            posts.add(curr.posts[i]);
        }
  }
  return posts;
}

/** @brief get the subreddit that the logged-in user is subscribed to
 * this function shall be awaited.
 * @return a list of new posts randomly picked in the list of subReddit
 */
Future<List<subReddit>> getMySubscriptions() async {
  final rsp = await http.get(
    Uri.parse("https://oauth.reddit.com/subreddits/mine/subscriber.json"),
    headers: {"Authorization": "Bearer " + getAuthToken(),
    },
  );
  List<subReddit> ls = List.empty(growable: true);

  if (rsp.statusCode == 200) {
    final jsonrsp = jsonDecode(rsp.body);
    for (int i = 0; i < jsonrsp["data"]["children"].length; i++) {
      ls.add(subReddit(jsonrsp["data"]["children"][i]["data"]["display_name"]));
    }
  } else {
    print("Failed data search because i got: ");
    print(rsp.statusCode);
    print(rsp.body);
  }
  return ls;
}