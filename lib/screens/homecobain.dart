import 'package:flutter/material.dart';
import 'screen1.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman daftar informasi saat tombol ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InformationListPage()),
            );
          },
          child: Text('Go to Information List'),
        ),
      ),
    );
  }
}
