// @dart=2.14

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


/*class TokenAsk extends StatefulWidget {
  const TokenAsk({Key? key}) : super(key: key);

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
}*/


String addArgsToUrl(String baseUrl, Map<String, String> args)
{
    baseUrl += "?";
    args.forEach((key, value) {
       baseUrl += "$key=$value&";
    });
    baseUrl = baseUrl.substring(0, baseUrl.length - 1   );
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
    print (addArgsToUrl(url, data));
    return addArgsToUrl(url, data);
}

_launchURL() async {
    String url = askAccess();
    if (await canLaunch(url)) {
        await launch(url);
    } else {
        throw 'Could not launch $url';
    }
}

class Route extends StatelessWidget {
    const Route({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return(new Scaffold(
            body: new Center(
                child: new RaisedButton(
                    onPressed: _launchURL,
                    child: new Text('Log in'),
                ),
            ),
        ));
    }
}

void main() => runApp(const MaterialApp(home: Route()));
//void main() => runApp(const MaterialApp(home: TokenAsk())) ;