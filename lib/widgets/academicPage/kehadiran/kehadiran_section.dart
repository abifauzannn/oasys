import 'package:flutter/material.dart';
import 'package:oasys/models/kehadiran.dart';
import 'package:oasys/api/auth_api.dart';

class KehadiranTab extends StatefulWidget {
  const KehadiranTab({Key? key}) : super(key: key);

  @override
  _KehadiranTabState createState() => _KehadiranTabState();
}

class _KehadiranTabState extends State<KehadiranTab> {
  late Future<Kehadiran?> _kehadiranFuture;

  @override
  void initState() {
    super.initState();
    _kehadiranFuture = AuthApi.getKehadiran();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Kehadiran?>(
      future: _kehadiranFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildBlinkingImage();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final kehadiran = snapshot.data!;
          return _buildList(context, kehadiran);
        } else {
          return NoKehadiran();
        }
      },
    );
  }

 Widget _buildBlinkingImage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center, // Memposisikan widget ke tengah layar secara vertikal
    children: [
      TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 500),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: child, // Widget 'child' dimasukkan ke dalam Opacity
          );
        },
        child: Image.asset(
          'assets/images/oasys-logo.png',
          height: 100,
          width: 100,
        ),
      ),
    ],
  );
}



  Widget _buildList(BuildContext context, Kehadiran kehadiran) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              periodeAkademmik(kehadiran.semesterAktif.tahunAwal,
                  kehadiran.semesterAktif.tahunAkhir),
              Divider(
                color: Colors.grey.withOpacity(0.3),
                thickness: 1,
                height: 20,
                indent: 0,
                endIndent: 0,
              ),
              listTitle(context),
              SizedBox(height: screenHeight * 0.01),
              Column(
                children: kehadiran.daftarKehadiran.map((kehadiranDetail) {
                  return Column(
                    children: [
                      InfoMataKuliah(kehadiranDetail: kehadiranDetail),
                      SizedBox(height: screenHeight * 0.01),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget periodeAkademmik(String tahunMasuk, String tahunAkhir) {
    return Text(
      'Periode $tahunMasuk/$tahunAkhir',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue[400],
      ),
    );
  }

  Widget listTitle(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Daftar Mata Kuliah',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: screenWidth * 0.01), // Tambahkan spasi antara teks
        Text(
          'Kehadiran',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class InfoMataKuliah extends StatelessWidget {
  final KehadiranDetail kehadiranDetail;

  const InfoMataKuliah({Key? key, required this.kehadiranDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                kehadiranDetail.namaMatkul,
                overflow: TextOverflow
                    .fade, // Jika teks melebihi, maka akan memudar di bagian akhirnya
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.128),
            Text(
              kehadiranDetail.presentaseKehadiran + '%',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: int.parse(kehadiranDetail.presentaseKehadiran) <= 50
                    ? Colors.red
                    : Colors.black,
              ),
            ),
          ],
        ),
        Text(
          '${kehadiranDetail.jumlahHadir}/${kehadiranDetail.jumlahTotal} Pertemuan',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class NoKehadiran extends StatelessWidget {
  const NoKehadiran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/noresult.png',
            width: screenWidth * 0.6,
            height: screenWidth * 0.6,
            fit: BoxFit.cover,
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
            'Oops!',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
            'Sepertinya daftar kehadiran kamu belum tersedia, selesaikan rencana studi terlebih dahulu',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
