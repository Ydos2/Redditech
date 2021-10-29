import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import "auth.dart";

class Profile {
    String username = "";
    String imageUrl = "";
    String bannerUrl = "";
    int karma = 0;

    Profile(String name, String imgUrl, String bannerUrl, int karma) {
        this.username = name;
        this.imageUrl = imgUrl;
        this.bannerUrl = bannerUrl;
        this.karma = karma;
    }
}

Future<Profile> getMyProfile() async {
    final rsp = await http.get(
      Uri.parse('https://oauth.reddit.com/api/v1/me.json'),
      headers: {"Authorization": "Bearer " + getAuthToken(),
      },
    );
    if (rsp.statusCode == 200) {
      final jsonrsp = jsonDecode(rsp.body);
      String name = jsonrsp["name"];
      print("u are > " + name);
      String img = jsonrsp["icon_img"];
      String banner = jsonrsp["subreddit"]["banner_img"];
      img = img.substring(0, img.indexOf("?"));
      banner = banner.substring(0, banner.indexOf("?"));
      return Profile(name, img, banner, jsonrsp["total_karma"]);
    } else {
      print("Failed data search because i got: ");
      print(rsp.statusCode);
      print(rsp.body);
      return Profile("", "", "", 0);
    }
}