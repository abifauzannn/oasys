import 'package:flutter/material.dart';
import 'package:oasys/api/auth_api.dart'; // Import AuthApi untuk menggunakan metode logout
import '../../screens/login_page.dart';
import '../../screens/reset_password.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ResetPassword(),
        SizedBox(height: screenHeight * 0.01),
        LogoutButton(), // Menggunakan widget LogoutButton yang telah dibuat
      ],
    );
  }
}

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth, // Ukuran lebar sesuai dengan lebar layar
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ResetPasswordPage()),
          );
        },
        style: OutlinedButton.styleFrom(
          primary: Colors.blue[900], // Warna teks tombol
          side: BorderSide(
            color: Colors.blue[900] ?? Colors.black,
          ), // Warna outline dan ketebalan garis
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ), // Padding di atas dan di bawah teks
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Custom border radius
          ),
        ),
        child: Text(
          'Reset Password',
          style: TextStyle(
            fontSize: 16, // Sesuaikan ukuran teks sesuai kebutuhan Anda
          ),
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: OutlinedButton(
        onPressed: () {
          // Panggil metode logout dari AuthApi saat tombol logout diklik
          _handleLogout(context);
        },
        style: OutlinedButton.styleFrom(
          primary: Colors.red[200],
          side: BorderSide(color: Color.fromRGBO(228, 110, 84, 1.0)),
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          'Logout',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Metode untuk menangani logout
  void _handleLogout(BuildContext context) async {
    // Menampilkan dialog konfirmasi
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: Color(0xFFFFFFFF),
          title: Image(
            image: AssetImage('assets/images/logout.png'),
            width: MediaQuery.of(context).size.width * 0.3,
            fit: BoxFit.cover,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure to Log out?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20), // Spacer
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        // Panggil metode logout dari AuthApi
                        AuthApi.logout().then((success) {
                          if (success) {
                            // Logout berhasil, tutup dialog dan kembali ke halaman login
                            Navigator.of(context).pop();
                            // Navigasi ke halaman login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage()), // Ganti LoginPage dengan nama kelas halaman login Anda
                            );
                          } else {
                            // Logout gagal, tampilkan pesan kesalahan atau tindakan yang sesuai
                          }
                        });
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 20), // Jarak antara tombol
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Menutup dialog
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
