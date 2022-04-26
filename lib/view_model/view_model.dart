import 'package:webview_flutter/webview_flutter.dart';
import '../app/app_links.dart';

class ViewModel {
  late WebViewController _controller;
  //WebViewController get controller => _controller;

  Future<void> onPressedBackButton() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    }
  }

  void onPressedRefreshButton() {
    _controller.reload();
  }

  Future<void> onPressedAddButton() async {
    final currentUrl = await _controller.currentUrl();
    currentUrl != AppLinks.addCourse
        ? _controller.loadUrl(AppLinks.addCourse)
        : _controller.loadUrl(AppLinks.youTube);
  }

  WebView webView() {
    return WebView(
      initialUrl: AppLinks.initial,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        _controller = controller;
      },
    );
  }
}
