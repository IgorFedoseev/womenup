import 'package:webview_flutter/webview_flutter.dart';
import '../app/app_links.dart';

class ViewModel {
  late WebViewController _controller;
  WebViewController get controller => _controller;

  Future<void> onPressedBackButton() async{
    if(await _controller.canGoBack()){
      _controller.goBack();
    }
  }

  void onPressedRefreshButton() {
    _controller.reload();
  }

  Future<void> onPressedAddButton() async {
    _controller.loadUrl(AppLinks.addCourse);
    //final currentUrl = await controller.currentUrl();
    //print(currentUrl);
  }

  WebView webView() {
    return WebView(
      initialUrl: AppLinks.initial,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller){
        _controller = controller;
      },
    );
  }
}