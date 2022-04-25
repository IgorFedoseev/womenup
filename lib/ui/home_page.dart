import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app/app_links.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async{
              if(await controller.canGoBack()){
                controller.goBack();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.reload(),
          ),
        ],
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: AppLinks.initial,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller){
            this.controller = controller;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        onPressed: () async{
          controller.loadUrl(AppLinks.addCourse);
          //final currentUrl = await controller.currentUrl();
          //print(currentUrl);
        },
      ),
    );
  }
}
