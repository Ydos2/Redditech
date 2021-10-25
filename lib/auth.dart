// @dart=2.14

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum LoginState { LOG_OUT, LOG_IN }
var redditToken;

class TokenAsk extends StatefulWidget {
  const TokenAsk({Key? key}) : super(key: key);

  @override
  TokenAskState createState() => TokenAskState();
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
                  redditToken = link.queryParameters["access_token"];
                });
                print(link);
                print(redditToken);
                // return new main screen
                return;
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
    'client_id': 'Kr2S-5p6EIY8D30UniEi9w',
    'response_type': 'token',
    'state': 'eeeeee',
    'redirect_uri': 'http://localhost:8080',
    'duration': 'temporary',
    'scope': 'history'
  };
  print(addArgsToUrl(url, data));
  return addArgsToUrl(url, data);
}

void main() => runApp(const MaterialApp(home: TokenAsk()));
