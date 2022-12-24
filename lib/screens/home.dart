import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mintacademy/components/bottom_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  static String routeName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebViewController _webViewController;

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
        initialUrl: 'https://mintacademy.in/',
        javascriptMode: JavascriptMode.unrestricted,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print("WebView is loading (progress : $progress%)");
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');

          // Removes header and footer from page
          _webViewController
              .runJavascript("javascript:(function() { " +
                  "var head = document.getElementsByTagName('header')[0];" +
                  "head.parentNode.removeChild(head);" +
                  "var footer = document.getElementsByTagName('footer')[0];" +
                  "footer.parentNode.removeChild(footer);" +
                  "})()")
              .then((value) => debugPrint('Page finished loading Javascript'))
              .catchError((onError) => debugPrint('$onError'));
        },
      ),
    );
  }
}
