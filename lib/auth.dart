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

/** \[Brief\] > This widget is used for the connection

    You may use it to gather the token, the authtoken will be collected by
    this widget
 */
class TokenAsk extends StatefulWidget {
  const TokenAsk({Key? key}) : super(key: key);

  @override
  TokenAskState createState() => TokenAskState();
}

String getAuthToken() {
  return (authToken);
}

/** \[Brief\] > Function to use to set the token to a value

    Can be sent a null so its null-sound-safe

 */
void setAuthToken(String? token) {
  authToken = token == null ? "null" : token;
  print("Token has been set to: " + authToken);
}

/** \[Brief\] > It is used to retrieve the token from the code send by reddit */
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
        'identity,edit,history,mysubreddits,read,subscribe,vote,account'
  };
  print(addArgsToUrl(url, data));
  return addArgsToUrl(url, data);
}

/** \[Brief\] > this class is a webview to get the code */
class TokenAskState extends State<TokenAsk> {
  late WebViewController control;
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
            onWebViewCreated: (WebViewController controller) {
              control = controller;
            },
            onPageStarted: (url) async {
              if (url.contains("code=")) {
                Uri link = Uri.dataFromString(url.substring(0, url.length - 2));
                var code;
                setState(() {
                  code = link.queryParameters["code"];
                });
                await retrieveToken(code);
                var prof = getMyProfile();
                USERPROFILE = await getMyProfile();
                return runApp(MyApp());
              } else if (url.contains("error")) {
                  print ("ight im outta here");
                  setState(() {
                    control.loadUrl(askAccess());
                  });
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

void main() => runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: TokenAsk()));
