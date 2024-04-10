import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subspace_admin/show_webview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Subspace Admin',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routes: {
          '/': (context) => MyHomePage(),
          '/showWebView': (context) => ShowWebView(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = '';

  @override
  void initState() {
    super.initState();
    getCaptcha();
  }

  getCaptcha() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => ShowWebView()));
      setState(() {
        _result = result ?? ''; // Update the result variable with the obtained result
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [Text(_result)],
        ),
      ),
    );
  }
}
