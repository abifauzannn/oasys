import 'package:flutter/material.dart';
import 'home_page.dart';
import 'academic_page.dart';
import 'profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oasys/models/pengumuman.dart';
import 'package:oasys/api/auth_api.dart';
import 'package:flutter_html/flutter_html.dart';
import '../widgets/informationPage/button_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    AcademicPage(),
    ListInformation(), // Menggunakan ListInformation langsung di sini
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[900],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
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
    );
  }
}

class ListInformation extends StatefulWidget {
  const ListInformation({Key? key}) : super(key: key);

  @override
  _ListInformationState createState() => _ListInformationState();
}

class _ListInformationState extends State<ListInformation> {
  late Future<List<PengumumanDetail>> _pengumumanListFuture;

  @override
  void initState() {
    super.initState();
    _pengumumanListFuture = AuthApi.getPengumuman();
  }

  Future<void> _refreshPengumumanList() async {
    setState(() {
      _pengumumanListFuture = AuthApi.getPengumuman();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Information',
          style: TextStyle(
              fontFamily: 'poppins', fontSize: 18, fontWeight: FontWeight.w600),
        ), // Judul halaman
      ),
      body: FutureBuilder<List<PengumumanDetail>>(
        future: _pengumumanListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final pengumumanList = snapshot.data!;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: pengumumanList.map((pengumumanDetail) {
                    return InformationCard(pengumumanDetail: pengumumanDetail);
                  }).toList(),
                ),
              ),
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({Key? key, required this.pengumumanDetail})
      : super(key: key);

  final PengumumanDetail pengumumanDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AboutInformation(pengumumanDetail: pengumumanDetail),
              ),
              CustomIcon(pengumumanDetail: pengumumanDetail),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.pengumumanDetail})
      : super(key: key);

  final PengumumanDetail pengumumanDetail;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailInformation(pengumumanDetail: pengumumanDetail)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}

class AboutInformation extends StatelessWidget {
  const AboutInformation({Key? key, required this.pengumumanDetail})
      : super(key: key);

  final PengumumanDetail pengumumanDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            pengumumanDetail.judul,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          pengumumanDetail.date,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

class DetailInformation extends StatelessWidget {
  final PengumumanDetail pengumumanDetail;

  const DetailInformation({Key? key, required this.pengumumanDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            return false;
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02, horizontal: screenWidth * 0.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ButtonSection(),
                  BannerInformation(),
                  TitleInformation(pengumumanDetail: pengumumanDetail),
                  BodyInformation(pengumumanDetail: pengumumanDetail),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BannerInformation extends StatelessWidget {
  const BannerInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image(
      width: screenWidth,
      height: screenHeight * 0.2,
      image: AssetImage('assets/images/bannerinformation.png'),
    );
  }
}

class TitleInformation extends StatelessWidget {
  final PengumumanDetail
      pengumumanDetail; // Menerima pengumumanDetail sebagai parameter

  const TitleInformation({Key? key, required this.pengumumanDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Text(
            pengumumanDetail.judul,
            // Gunakan judul dari pengumumanDetail
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Text(
            pengumumanDetail.date, // Gunakan tanggal dari pengumumanDetail
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}

class BodyInformation extends StatelessWidget {
  final PengumumanDetail
      pengumumanDetail; // Menerima pengumumanDetail sebagai parameter

  const BodyInformation({Key? key, required this.pengumumanDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          child: Html(
            data: pengumumanDetail.isi,
            style: {
              'body': Style(
                fontFamily: 'Poppins',
                fontSize: FontSize(14.0),
                color: Colors.black,
              ),
            },
          ),
        ),
      ],
    );
  }
}
