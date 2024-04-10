# flutter-recaptcha

1. Add webview_flutter as a dependency in your pubspec.yaml file.
```yaml
      dependencies:
        webview_flutter: ^4.7.0
```
2. Add [show_webview.dart](https://github.com/Grow90/flutter-recaptcha/blob/main/lib/show_webview.dart) file to your project
3. Import the file in your project
```dart
      import 'show_webview.dart';
```
4. Call the ShowWebView widget in your project
```dart
      final token = await Navigator.push(context, MaterialPageRoute(builder: (_) => ShowWebView()));
```

