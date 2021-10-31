import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'auth.dart';

class Post {
  String title = "";
  String? subtext = "";
  String? imageUrl = "";
  int upvotes = 0;

  Post(String title, String? subtext, String? image, int upvotes) {
    this.title = title;
    this.subtext = subtext;
    this.imageUrl = image;
    this.upvotes = upvotes;
  }
}

class subReddit {
  String name = "";
  List<Post> posts = new List<Post>.filled(0, Post("", "", "", 0), growable: true);

  subReddit(String name) {
    this.name = name;
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
      for (int i = 0; i != jsonrsp["data"]["children"].length; i++) {
        var title = jsonrsp["data"]["children"][i]["data"]["title"];
        var text = jsonrsp["data"]["children"][i]["data"]["selftext"];
        var image = jsonrsp["data"]["children"][i]["data"]["thumbnail"];
        var upvotes = jsonrsp["data"]["children"][i]["data"]["ups"];
        this.posts.add(new Post(title, text, image == "self" ? null : image, upvotes));
      }
      return true;
    } else {
      print("Failed data search because i got: ");
      print(rsp.statusCode);
      print(rsp.body);
      return false;
    }
  }
}