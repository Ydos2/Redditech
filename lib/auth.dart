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
import "Profile.dart";
import "SettingClass.dart";
import 'package:redditech/home_page.dart';

enum LoginState { LOG_OUT, LOG_IN }
var authToken = "";

class TokenAsk extends StatefulWidget {
  const TokenAsk({Key? key}) : super(key: key);

  @override
  TokenAskState createState() => TokenAskState();
}

String getAuthToken() {
  return (authToken);
}

void setAuthToken(String? token) {
  authToken = token == null ? "null" : token;
  print("Token has been set to: " + authToken);
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
    setAuthToken(jsonrsp["access_token"]);
    return;
  } else {
    print("Failed data search because i got: ");
    print(rsp.statusCode);
    print(rsp.body);
    return;
  }
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
        'identity,edit,flair,history,modconfig,modflair,modlog,modposts,modwiki,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread,account'
  };
  print(addArgsToUrl(url, data));
  return addArgsToUrl(url, data);
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
            onPageStarted: (url) async {
              if (url.contains("code=")) {
                print(url);
                Uri link = Uri.dataFromString(url.substring(0, url.length - 2));
                var code;
                setState(() {
                  code = link.queryParameters["code"];
                });
                await retrieveToken(code);
                var prof = getMyProfile();
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
  print(baseUrl);
  return (baseUrl);
}

void main() => runApp(const MaterialApp(home: TokenAsk()));
