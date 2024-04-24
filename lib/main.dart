import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'screens/login_page.dart';
import 'screens/forget_password.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
