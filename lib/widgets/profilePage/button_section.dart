import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(children: [
      ResetPassword(),
      SizedBox(height: screenHeight * 0.01),
      Logout(),
    ]);
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
          // Implementasi fungsi untuk mereset password
        },
        style: OutlinedButton.styleFrom(
          primary: Colors.blue[900], // Warna teks tombol
          side: BorderSide(
              color: Colors.blue[900] ??
                  Colors.black), // Warna outline dan ketebalan garis
          padding: EdgeInsets.symmetric(
              vertical: 12), // Padding di atas dan di bawah teks
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

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth,
      child: OutlinedButton(
        onPressed: () {
          // Menampilkan dialog konfirmasi saat tombol diklik
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                alignment: Alignment.bottomCenter,
                backgroundColor: Color(0xFFFFFFFF),
                title: Image(
                  image: AssetImage('assets/images/logout.png'),
                  width: screenWidth * 0.3,
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
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Posisikan tombol di tengah
                        children: [
                          ElevatedButton( 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              foregroundColor: Colors.white,
                               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Tambahkan padding
                            ),           
                            onPressed: () {
                              Navigator.of(context).pop(); // Menutup dialog
                            },
                            child: Text('Yes', style: TextStyle(fontSize: 15, fontFamily: 'poppins', fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(width: 20), // Jarak antara tombol
                          TextButton(
                            onPressed: () {
                              // Implementasi logout
                              Navigator.of(context).pop(); // Menutup dialog
                              // Implementasi fungsi logout
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: 'poppins'),
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
}
