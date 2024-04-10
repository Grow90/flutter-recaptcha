import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWebView extends StatefulWidget {
  ShowWebView({Key? key, required this.action, required this.site_id})
      : super(key: key);

  final String action;
  final String site_id;
  @override
  _ShowWebViewState createState() => _ShowWebViewState();
}

class _ShowWebViewState extends State<ShowWebView> {
  final ValueNotifier<double> progressNotifier = ValueNotifier<double>(0.0);
  late final WebViewController _webViewController;

  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Color.fromRGBO(27, 27, 27, 1))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            progressNotifier.value = progress / 100;
          },
          onPageFinished: (s) {
            if (s.startsWith("https://superflow.run/auth/captchaDone/")) {
              Navigator.pop(
                  context,
                  s.replaceFirst(
                      "https://superflow.run/auth/captchaDone/", ""));
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://superflow.run/auth/captchaUser/auth/${widget.site_id}"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1b1b1b),
        body: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: progressNotifier,
              builder: (BuildContext context, double value, child) {
                return value < 1
                    ? LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.indigo),
                        value: value,
                      )
                    : Container();
              },
            ),
            Expanded(
              child: WebViewWidget(controller: _webViewController),
            ),
          ],
        ),
      ),
    );
  }
}
