import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../values/strings.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
          onNavigationRequest: (request) => NavigationDecision.navigate))
      ..clearLocalStorage()
      ..clearCache()
      ..loadRequest(
          Uri.parse('https://nicoitorma.github.io/ocg-knn/ocg-about.html'));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(labelAbout)),
        body: WebViewWidget(
          controller: controller,
        ));
  }
}
