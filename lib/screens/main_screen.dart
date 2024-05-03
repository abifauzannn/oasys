import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oasys/screens/academic_page.dart';
import 'information_page.dart'; // Import file yang diperlukan
import 'home_page.dart';
import 'academic_page.dart';
import 'profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>(); // Tambahkan navigatorKey
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    AcademicPage(),
    InformationPage(), // Inisialisasi ListInformation
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator( // Ganti Scaffold dengan Navigator
      key: _navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold( // Wrap widget dengan Scaffold
            body: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              selectedItemColor: Colors.blue[900],
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: SvgPicture.asset(
                      'assets/svg/menu.svg',
                      color: _currentIndex == 0 ? Colors.blue[900] : Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: SvgPicture.asset(
                      'assets/svg/discovery.svg',
                      color: _currentIndex == 1 ? Colors.blue[900] : Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  label: 'Academic',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: SvgPicture.asset(
                      'assets/svg/message.svg',
                      color: _currentIndex == 2 ? Colors.blue[900] : Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  label: 'Information',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: SvgPicture.asset(
                      'assets/svg/profile.svg',
                      color: _currentIndex == 3 ? Colors.blue[900] : Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
