import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'auth.dart';

class Post {
    String title = "";

    Post() {}
}

class subReddit {
    String name = "";
    List<Post> posts = new List<Post>.filled(0, Post(), growable: true);

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
            return true;
        } else {
            print("Failed data search because i got: ");
            print(rsp.statusCode);
            print(rsp.body);
            return false;
        }
    }
}