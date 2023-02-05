import 'package:flutter/material.dart';
import 'package:telegram_app_ui_design/screens/root_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootApp(),
    );
  }
}
