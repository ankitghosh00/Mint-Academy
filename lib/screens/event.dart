import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mintacademy/components/bottom_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class eventScreen extends StatefulWidget {
  static String routeName;
  @override
  eventScreenState createState() => eventScreenState();
}

WebViewController _webViewController;

class eventScreenState extends State<eventScreen> {
  void initState() {
    super.initState();
    false;

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if (Platform.isIOS) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          print('back');
          return false;
        } else {
          print('ok');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BottomBarScreen();
          }));
        }
      },
      child: WebView(
        initialUrl: 'https://mintacademy.in/explore/',
        javascriptMode: JavascriptMode.unrestricted,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }
}
