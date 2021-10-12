// @dart=2.9

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TokenAsk extends StatefulWidget {
  const TokenAsk({Key key}) : super(key: key);

    @override
    TokenAskState createState() => TokenAskState();
}

class TokenAskState extends State<TokenAsk> {
    @override
    void initState() {
        super.initState();
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    }
    @override
    Widget build(BuildContext context) {
        return WebView(initialUrl: askAccess());
    }
}


String addArgsToUrl(String baseUrl, Map<String, String> args)
{
    baseUrl += "?";
    args.forEach((key, value) {
       baseUrl += "$key=$value&";
    });
    baseUrl.substring(0, baseUrl.length - 1);
    return (baseUrl);
}

String askAccess()
{
    String url = "https://www.reddit.com/api/v1/authorize";

    Map<String, String> data = {
        'client_id': 'qix2qQzhsmeJwSpKa-HJ5w',
        'response_type': 'code',
        'state': 'trucRandomFautVraimentFaireUnGenerateurRandom',
        'redirect_uri': 'http://localhost:8080',
        'duration': 'permanent',
        'scope': 'history'
    };
    return addArgsToUrl(url, data);
}

void main() => runApp(const MaterialApp(home: TokenAsk())) ;