import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart' as auth;

Future <bool> logMe(String user, String password) async
{
    http.Client c = auth.BasicAuthClient("qix2qQzhsmeJwSpKa-HJ5w", "_QJP_1fxo3vVgSTy6zOSK8Y0mUo5PQ");
    Uri url = Uri.Parse("https://www.reddit.com/api/v1/access_token");

    Map data = {
        "grant_type": "password",
        "username": user,
        "password": password
    };

    var body = json.encode(data);

    var resp = await c.post(url, body: body);

    print("${resp.statusCode}");
    print("${resp.body}");
    c.close();
    return true;
}

main() {
    logMe("oof", "eeee");
}
