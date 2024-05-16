import 'package:flutter/material.dart';
import '../../api/auth_api.dart';
import '../../models/homepage.dart';

class AkademikSection extends StatefulWidget {
  const AkademikSection({Key? key}) : super(key: key);

  @override
  _AkademikSectionState createState() => _AkademikSectionState();
}

class _AkademikSectionState extends State<AkademikSection> {
  late Future<HomePage?> _homePageFuture;

  @override
  void initState() {
    super.initState();
    _homePageFuture = AuthApi.getHomePage();
  }

  Future<void> _refreshHomePage() async {
    setState(() {
      _homePageFuture = AuthApi.getHomePage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshHomePage,
      child: FutureBuilder<HomePage?>(
        future: _homePageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            final header = snapshot.data!;
            return _buildAkademik(context, header);
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }

  Widget _buildAkademik(BuildContext context, HomePage header) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenHeight * 1 / 12,
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PeriodeAkademik(
              namaSemester: header.semesterAktif.namaSemester,
              tahunAwal: header.semesterAktif.tahunAwal,
              tahunAkhir: header.semesterAktif.tahunAkhir),
          IpkUser(ipk: header.infoMahasiswa.ipk),
        ],
      ),
    );
  }
}

class PeriodeAkademik extends StatelessWidget {
  final String namaSemester;
  final String tahunAwal;
  final String tahunAkhir;

  PeriodeAkademik(
      {required this.namaSemester,
      required this.tahunAwal,
      required this.tahunAkhir});

  @override
  Widget build(BuildContext context) {
    final namsem =
        namaSemester[0].toUpperCase() + namaSemester.substring(1).toLowerCase();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Periode Akademik',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5), // Menggunakan height daripada width untuk spasi
        Text(
          '${namsem} ${tahunAwal}/${tahunAkhir}',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class IpkUser extends StatelessWidget {
  final double ipk;

  IpkUser({required this.ipk});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[600],
        borderRadius: BorderRadius.circular(10), // Menambahkan border radius
      ),
      padding: EdgeInsets.all(7.0),
      child: Column(
        children: [
          Text(
            'IPK : ', // Menampilkan IPK dengan dua angka di belakang koma
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            ),
          ),
          Text(
            '${ipk.toStringAsFixed(2)}',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            ),
          )
        ],
      ),
    );
  }
}
