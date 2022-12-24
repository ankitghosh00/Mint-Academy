import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class account extends StatefulWidget {
  const account({key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  void initState() {
    super.initState();
    true;
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if (Platform.isIOS) WebView.platform = SurfaceAndroidWebView();
  }

  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://mintacademy.in/my-account/',
    );
  }
}
