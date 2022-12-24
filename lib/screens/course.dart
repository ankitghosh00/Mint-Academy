import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mintacademy/components/bottom_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  static String routeName;

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

WebViewController _webViewController;

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    false;
    // Enable virtual display.
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
          // return false;
        }
      },
      child: WebView(
        initialUrl: 'https://mintacademy.in/courses/',
        javascriptMode: JavascriptMode.unrestricted,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        onWebViewCreated: (WebViewController controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}
