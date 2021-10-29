import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'auth.dart';

class Post {
    String title = "";

    Post(String title) {
        this.title = title;
    }
}

class subReddit {
    String name = "";
    List<Post> posts = new List<Post>.filled(0, Post(""), growable: true);

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
<<<<<<< Updated upstream
            print(rsp.body);
            for (int i = 0; i != jsonrsp["data"]["children"].length; i++) {
                print(jsonrsp["data"]["children"][i]["data"]["title"]);
//              print(jsonrsp["data"]["children"][i]["data"]["selftext"]);
            }
            print("it unexpectedly worked !");
=======
>>>>>>> Stashed changes
            return true;
        } else {
            print("Failed data search because i got: ");
            print(rsp.statusCode);
            print(rsp.body);
            return false;
        }
    }
}