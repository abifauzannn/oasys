import 'package:flutter/material.dart';
import '../../api/auth_api.dart';
import '../../models/homepage.dart';

class AkademikSection extends StatelessWidget {
  const AkademikSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomePage?>(
      future: AuthApi.getHomePage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final header = snapshot.data!;
          return _buildAkademik(context, header);
        } else {
          return Text('No data available');
        }
      },
    );
  }

  Widget _buildAkademik(BuildContext context, HomePage header) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          periodeAkademik(header.semesterAktif.namaSemester ,header.semesterAktif.tahunAwal, header.semesterAktif.tahunAkhir),
          ipkUser(header.infoMahasiswa.ipk),
        ],
      ),
    );
  }

  Widget periodeAkademik(String namaSemester, String tahunAwal, String tahunAkhir) {
    final namsem = namaSemester[0].toUpperCase() + namaSemester.substring(1).toLowerCase();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget ipkUser(double ipk) {
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
