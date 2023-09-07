import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../values/strings.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
          onNavigationRequest: (request) => NavigationDecision.navigate))
      ..clearLocalStorage()
      ..clearCache()
      ..loadRequest(
          Uri.parse('https://nicoitorma.github.io/ocg-knn/ocg-help.html'));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(labelHelp)),
        body: WebViewWidget(
          controller: controller,
        ));
  }
}
