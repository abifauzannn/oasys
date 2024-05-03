import 'package:flutter/material.dart';

class DetailInformation extends StatelessWidget {
  const DetailInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth,
        child: SingleChildScrollView(
            child: Column(children: [
          BannerInformation(),
          TitleInformation(),
          BodyInformation(),
        ])));
  }
}

class BannerInformation extends StatelessWidget {
  const BannerInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image(
      width: screenWidth, // Set lebar gambar sesuai dengan lebar layar
      height: screenHeight * 0.2,
      image: AssetImage('assets/images/bannerinformation.png'),
    );
  }
}

class TitleInformation extends StatelessWidget {
  const TitleInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.01),
        Text(
          'Pengumuman Batas Cetak Kartu Rencana Studi Tahun akademik 2023/2024',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
            height: screenHeight *
                0.001), // Menambahkan jarak di antara teks admin dan bawahnya
        Text(
          'Admin Fakultas - 2 h',
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

class BodyInformation extends StatelessWidget {
  const BodyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.02),
        Text(
          'Tertanda, Diberitahukan kepada seluruh mahasiswa aktif Program Sarjana (S1) Universitas ABC bahwa batas akhir untuk pencetakan Kartu Rencana Studi (KRS) untuk tahun akademik 2023/2024 telah ditetapkan. Mohon diperhatikan bahwa setiap mahasiswa harus menyelesaikan proses pencetakan KRS mereka sebelum tanggal yang telah ditentukan.\n\n'
          'Proses pencetakan KRS adalah tahap kritis dalam persiapan setiap mahasiswa untuk semester mendatang. Ini memungkinkan para mahasiswa untuk merencanakan jadwal kuliah mereka dengan tepat, memilih mata kuliah yang sesuai dengan kurikulum studi mereka, dan menetapkan landasan yang kuat untuk pencapaian akademis yang sukses.\n\n'
          'Kami sangat menekankan pentingnya mengikuti jadwal yang telah ditentukan, karena keterlambatan dalam pencetakan KRS dapat berdampak negatif pada proses akademik dan perkembangan studi Anda. Oleh karena itu, kami mendorong Anda semua untuk segera melengkapkan proses pencetakan KRS Anda sebelum batas waktu yang ditentukan.\n\n'
          'Terima kasih atas perhatian dan kerjasama Anda dalam hal ini. Jika Anda memiliki pertanyaan lebih lanjut atau memerlukan bantuan tambahan, jangan ragu untuk menghubungi bagian administrasi akademik kami.\n\n'
          'Salam hormat,\n[Penandatangan]',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
