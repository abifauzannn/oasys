import 'package:flutter/material.dart';
import 'package:oasys/screens/academicScreen/kehadiran.dart';
import 'package:oasys/screens/academicScreen/nilai_page.dart';
import 'package:oasys/screens/academicScreen/rencana_studi.dart';
import 'package:oasys/screens/academicScreen/jadwal.dart';

class AcademicPage extends StatelessWidget {
  const AcademicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabbarExample();
  }
}

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Academic',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.blue[900],
            indicatorColor: Colors.blue[900],
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.5,
              fontFamily: 'Poppins',
            ),
            tabs: [
              Tab(text: 'Rencana Studi'),
              Tab(text: 'Kehadiran'),
              Tab(text: 'Jadwal'),
              Tab(text: 'Nilai'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Isi untuk Tab 1
            RencanaStudi(),
            // Isi untuk Tab 2
            Kehadiran(),
            // Isi untuk Tab 3
            Jadwal(),
            // Isi untuk Tab 4
            InformasiNilai(),
          ],
        ),
      ),
    );
  }
}
