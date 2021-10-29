import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import "auth.dart";

class Settings {
  bool hide_down = true;
  bool hide_up = true;
  bool email_on_pm = true;
  bool is_adult = true;
  bool show_nsfw = true;
  bool dark_mode = true;

  Settings() {}

  Settings copy() {
    Settings s = new Settings();

    s.hide_down = this.hide_down;
    s.hide_up = this.hide_up;
    s.email_on_pm = this.email_on_pm;
    s.is_adult = this.is_adult;
    s.show_nsfw = this.show_nsfw;
    s.dark_mode = this.dark_mode;
    return s;
  }

  Future recover() async {
    Settings set = new Settings();

    final rsp = await http.get(
      Uri.parse("https://oauth.reddit.com/api/v1/me/prefs"),
      headers: {
        "Authorization": "bearer " + getAuthToken(),
      },
    );
    if (rsp.statusCode == 200) {
      final jsonrsp = jsonDecode(rsp.body);
      this.hide_up = jsonrsp["hide_ups"];
      this.hide_down = jsonrsp["hide_downs"];
      this.email_on_pm = jsonrsp["email_private_message"];
      this.is_adult = jsonrsp["over_18"];
      this.show_nsfw = jsonrsp["label_nsfw"];
      this.dark_mode = jsonrsp["nightmode"];
    } else {
      print("Failed data search because i got: ");
      print(rsp.statusCode);
      print(rsp.body);
    }
  }

  Future apply() async {
    final data = json.encode({
      "hide_ups": this.hide_up,
      "hide_downs": this.hide_down,
      "email_on_pm": this.email_on_pm,
      "over_18": this.is_adult,
      "label_nsfw": this.show_nsfw,
      "nightmode": this.dark_mode,
    });

    final rsp = await http.patch(
      Uri.parse("https://oauth.reddit.com/api/v1/me/prefs"),
      headers: {
        "Authorization": "bearer " + getAuthToken(),
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: data,
    );
    print(rsp.body);
    print(rsp.statusCode);
  }
}
