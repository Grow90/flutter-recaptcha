# flutter-recaptcha

1. Add [show_webview.dart](https://github.com/Grow90/flutter-recaptcha/blob/main/lib/show_webview.dart) file to your project
2. Import the file in your project
```dart
      import 'show_webview.dart';
```
3. Call the ShowWebView widget in your project
```dart
      final token = await Navigator.push(context, MaterialPageRoute(builder: (_) => ShowWebView()));
```

