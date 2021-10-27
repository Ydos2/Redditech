// @dart=2.14

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'subReddit.dart';
import 'package:redditech/home_page.dart';

enum LoginState { LOG_OUT, LOG_IN }
var authToken = "";

class TokenAsk extends StatefulWidget {
  const TokenAsk({Key? key}) : super(key: key);

  @override
  TokenAskState createState() => TokenAskState();
}

String getAuthToken() {
  print("authToken: " + authToken);
  return (authToken);
}

void setAuthToken(String? token) {
  print("i did set the token :D");
  authToken = token == null ? "null" : token;
}

Future<void> retrieveToken(String code) async {
  String username = 'BFZHFNgg7jaA56q4idvvyg';
  String password = 'GIGTERPAvmnhm6znH1zo8cWYsx6Rxg';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  var url = Uri.parse("https://www.reddit.com/api/v1/access_token");
  final rsp = await http.post(
    Uri.parse('https://www.reddit.com/api/v1/access_token'),
    headers: {
      "authorization": basicAuth,
    },
    body: {
      "grant_type": "authorization_code",
      "code": code,
      "redirect_uri": "http://localhost:8080",
    },
  );
  if (rsp.statusCode == 200) {
    final jsonrsp = jsonDecode(rsp.body);
    print(jsonrsp["access_token"]);
    setAuthToken(jsonrsp["access_token"]);
    return;
  } else {
    print("Failed data search because i got: ");
    print(rsp.statusCode);
    print(rsp.body);
    return;
  }
}

class TokenAskState extends State<TokenAsk> {
  final Completer<WebViewController> control = Completer<WebViewController>();
  LoginState _state = LoginState.LOG_OUT;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
            initialUrl: askAccess(),
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              control.complete(controller);
            },
            onPageStarted: (url) {
              if (url.contains("access_token=")) {
                Uri link = Uri.dataFromString(url.replaceFirst('#', '?'));
                setState(() {
                  setAuthToken(link.queryParameters["access_token"]);
                });
                return runApp(MyApp());

                print(link);
                print(authToken);
                var sub = new subReddit("python");
                sub.getHot();
              }
              if (url.contains("code=")) {
                print(url);
                Uri link = Uri.dataFromString(url.substring(0, url.length - 2));
                var code;
                setState(() {
                  code = link.queryParameters["code"];
                });
                retrieveToken(code);
                var sub = new subReddit("test");
                sub.getHot();

                return runApp(MyApp());
              }
            }));
  }
}

String addArgsToUrl(String baseUrl, Map<String, String> args) {
  baseUrl += "?";
  args.forEach((key, value) {
    baseUrl += "$key=$value&";
  });
  baseUrl = baseUrl.substring(0, baseUrl.length - 1);
  return (baseUrl);
}

String askAccess() {
  String url = "https://www.reddit.com/api/v1/authorize";

  Map<String, String> data = {
    'client_id': 'BFZHFNgg7jaA56q4idvvyg',
    'response_type': 'code',
    'state': 'eeeeee',
    'redirect_uri': 'http://localhost:8080',
    'duration': 'permanent',
    'scope':
        'identity,edit,flair,history,modconfig,modflair,modlog,modposts,modwiki,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread'
  };
  print(addArgsToUrl(url, data));
  return addArgsToUrl(url, data);
}

void main() => runApp(const MaterialApp(home: TokenAsk()));
