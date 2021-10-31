import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'auth.dart';

class Post {
  String title = "";
  String? subtext = "";
  String? imageUrl = "";
  String subReddit = "";
  String author = "";
  int upvotes = 0;

  Post(String title, String? subtext, String? image, String sub, String poster, int upvotes) {
    this.title = title;
    this.subtext = subtext;
    this.imageUrl = image;
    this.upvotes = upvotes;
    this.subReddit = sub;
    this.author = poster;
  }
}

class subReddit {
  String name = "";
  List<Post> posts = new List<Post>.filled(0, Post("", "", "", "", "", 0), growable: true);

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
      this.posts.add(new Post(title, text, image == "self" ? null : image, subreddit, poster, upvotes));
    }
  }

  Future unsubscribe() async {
    await http.post(Uri.parse("https://oauth.reddit.com/api/subscribe?action=unsub&action_source=r&skip_initial_defaults=true&sr_name=" + this.name),
        headers: {"Authorization": "bearer " + getAuthToken(),
        "X-Modhash": "null",
        },
    );
  }

  Future subscribe() async {
      await http.post(Uri.parse("https://oauth.reddit.com/api/subscribe?action=sub&action_source=r&skip_initial_defaults=true&sr_name=" + this.name),
      headers: {"Authorization": "bearer " + getAuthToken(),
      "X-Modhash": "null",
      },
      );
  }

  Future<bool> getTop() async {
    final rsp = await http.get(
      Uri.parse('https://oauth.reddit.com/r/' + this.name + '/top.json'),
      headers: {"Authorization": "bearer " + getAuthToken(),
      },
    );
    print("Authorization: bearer " + getAuthToken());
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

  Future<bool> getNew() async {
    final rsp = await http.get(
      Uri.parse('https://oauth.reddit.com/r/' + this.name + '/new.json'),
      headers: {"Authorization": "bearer " + getAuthToken(),
      },
    );
    print("Authorization: bearer " + getAuthToken());
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

  Future<bool> getHot() async {

    final rsp = await http.get(
      Uri.parse('https://oauth.reddit.com/r/' + this.name + '/hot.json'),
      headers: {"Authorization": "bearer " + getAuthToken(),
      },
    );
    print("Authorization: bearer " + getAuthToken());
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