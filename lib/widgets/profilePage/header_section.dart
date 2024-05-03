import 'package:flutter/material.dart';
import 'package:oasys/api/auth_api.dart';
import 'package:oasys/models/user.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfile?>(
      future: AuthApi.getProfile(), // Ambil profil pengguna dari API
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Tampilkan loading indicator jika data masih dimuat
        } else if (snapshot.hasError) {
          return Text(
              'Error: ${snapshot.error}'); // Tampilkan pesan error jika terjadi kesalahan
        } else if (snapshot.hasData && snapshot.data != null) {
          // Jika data profil pengguna sudah tersedia, tampilkan informasi pengguna
          final userProfile = snapshot.data!;
          return _buildUserProfile(context, userProfile); // Panggil _buildUserProfile dengan context dan userProfile
        } else {
          return Text(
              'No data available'); // Tampilkan pesan jika tidak ada data yang tersedia
        }
      },
    );
  }

  Widget _buildUserProfile(BuildContext context, UserProfile userProfile) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Padding kiri
        child: Column(
          // Row untuk mengelompokkan gambar dan teks
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan elemen secara vertikal
          children: [
            Container(
              width: screenWidth * 0.3,
              height: screenHeight * 0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Ubah angka sesuai keinginan Anda
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Angka yang sama dengan yang di atas
                child: Image(
                  image: AssetImage('assets/images/userprofile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userProfile.name, // Menggunakan nama dari userProfile
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: screenHeight * 0.003),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/award.png'),
                      width: screenWidth * 0.05,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      'NIM: ${userProfile.nim}', // Menggunakan nim dari userProfile
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.blue[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.003),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/star.png'),
                      width: screenWidth * 0.05,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      'IF - 901', // Menggunakan kelas dari userProfile, jika tidak ada, gunakan "Tidak ada"
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.purple[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
