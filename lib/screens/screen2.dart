import 'package:flutter/material.dart';

class InformationDetailPage extends StatelessWidget {
  final String informationTitle;
  final String informationContent;

  const InformationDetailPage({
    Key? key,
    required this.informationTitle,
    required this.informationContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Kembali ke halaman daftar informasi ketika tombol kembali ditekan
        Navigator.pop(context);
        return false; // Tetap di halaman detail
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(informationTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(informationContent),
        ),
      ),
    );
  }
}
