import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oasys/screens/splash.dart';
import '../../screens/home_page.dart'; // Import halaman-halaman yang diperlukan

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blue[900],
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });

        // Navigasi langsung ke halaman yang sesuai saat item diklik
        switch (value) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 1:
          
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Splash()),
            );
            break;
          case 2:
            // Navigasi ke halaman InformationPage jika item Information diklik
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => InformationPage()),
            // );
            break;
          case 3:
            // Navigasi ke halaman ProfilePage jika item Profile diklik
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProfilePage()),
            // );
            break;
          default:
            break;
        }
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
    );
  }
}
