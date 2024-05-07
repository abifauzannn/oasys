import 'package:flutter/material.dart';
import 'package:oasys/models/rencana_studi.dart';
import 'package:oasys/api/auth_api.dart';

class MataKuliah extends StatelessWidget {
  const MataKuliah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AcademicRencanaStudi?>(
      future: AuthApi.getRencanaStudi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final rencanaStudi = snapshot.data!;
          return _buildList(context, rencanaStudi);
        } else {
          return NoMataKuliah();
        }
      },
    );
  }

  Widget _buildList(BuildContext context, AcademicRencanaStudi rencanaStudi) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              periodeAkademmik(rencanaStudi.semesterAktif.tahunAwal,
                  rencanaStudi.semesterAktif.tahunAkhir),
              Divider(
                color: Colors.grey.withOpacity(0.3),
                thickness: 1,
                height: 20,
                indent: 0,
                endIndent: 0,
              ),
              listTitle(),
              SizedBox(height: screenHeight * 0.01),
              Column(
                children: rencanaStudi.daftarMatkul.map((matkul) {
                  return Column(
                    children: [
                      InfoMataKuliah(matkul: matkul), // Widget InfoMataKuliah
                      SizedBox(
                          height:
                              screenHeight * 0.01), // Jarak vertikal antara setiap widget InfoMataKuliah
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

  Widget listTitle() {
    return const Row(
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
        Text(
          'SKS',
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
  final DaftarMatkul matkul;

  const InfoMataKuliah({Key? key, required this.matkul}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screeHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                matkul.namaMatkul,
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
          // Tambahkan spasi antara teks
            Text(
              matkul.sksMatkul.toString(), // Menampilkan jumlah SKS
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: screeHeight * 0.003),
        Text(
          matkul.kodeMatkul,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class NoMataKuliah extends StatelessWidget {
  const NoMataKuliah({Key? key}) : super(key: key);

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
          SizedBox(height: screenHeight * 0.03), // Spasi antara gambar dan teks
          Text(
            'Oops!',
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
              'Sepertinya rencana studi kamu belum diterbitkan, lakukan proses administrasi terlebih dahulu',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w400)), // Spasi antara gambar dan teks
        ],
      ),
    );
  }
}
