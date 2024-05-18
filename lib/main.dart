import 'package:flutter/material.dart';
import 'package:oasys/screens/information_page.dart';
import 'screens/splash.dart';
import 'screens/login_page.dart';
import 'screens/forget_password.dart';
import 'screens/home_page.dart';
import 'screens/main_screen.dart';
import 'screens/screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './api/auth_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Memuat token dari penyimpanan lokal
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedToken = prefs.getString('token');

  Widget homePage;

  // Lakukan autentikasi dengan token yang tersimpan jika ada
  if (savedToken != null && savedToken.isNotEmpty) {
    // Gunakan token yang tersimpan untuk autentikasi
    homePage = MainScreen(); // Jika token ada, arahkan ke MainScreen
  } else {
    homePage = LoginPage(); // Jika token tidak ada, arahkan ke LoginPage
  }

  runApp(MyApp(homePage: homePage));
}

class MyApp extends StatelessWidget {
  final Widget? homePage;

  const MyApp({Key? key, this.homePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage ??
          Splash(), // Set SplashScreen as default if homePage is not provided
      routes: {
        '/login': (context) => LoginPage(),
        '/forgetPassword': (context) => ForgetPassword(),
        '/mainScreen': (context) => MainScreen(),
        '/homePage': (context) => HomePage(),
        '/splash': (context) => Splash(),
      },
    );
  }
}
