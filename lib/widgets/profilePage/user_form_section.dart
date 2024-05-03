import 'package:flutter/material.dart';
import '../../api/auth_api.dart';
import '../../models/user.dart'; // Using the UserProfile model that was previously created

class FormProfile extends StatelessWidget {
  const FormProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfile?>(
      future: AuthApi.getProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final profile = snapshot.data!;
          return _buildProfileForm(context, profile);
        } else {
          return Text('No data available');
        }
      },
    );
  }

  Widget _buildProfileForm(BuildContext context, UserProfile profile) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          TahunMasuk(tahunMasuk: profile.entryYear.toString()),
          SizedBox(height: screenHeight * 0.02),
          ProgramStudi(programStudi: profile.studyProgram),
          SizedBox(height: screenHeight * 0.02),
          Fakultas(fakultas: profile.faculty),
          SizedBox(height: screenHeight * 0.02),
          Username(username: profile.username),
        ],
      ),
    );
  }
}

class TahunMasuk extends StatelessWidget {
  final String tahunMasuk;

  const TahunMasuk({Key? key, required this.tahunMasuk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tahun Masuk',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: screenHeight * 0.01),
        TextFormField(
          style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: tahunMasuk,
            filled: true,
            fillColor: const Color(0xFFF6F7FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black),
            ),
            labelStyle: const TextStyle(
              color: Colors.black45,
            ),
          ),
        ),
      ],
    );
  }
}

class ProgramStudi extends StatelessWidget {
  final String programStudi;

  const ProgramStudi({Key? key, required this.programStudi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Program Studi',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: screenHeight * 0.01),
        TextFormField(
         style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: programStudi,
            filled: true,
            fillColor: const Color(0xFFF6F7FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black),
            ),
            labelStyle: const TextStyle(
              color: Colors.black45,
            ),
          ),
        ),
      ],
    );
  }
}

class Fakultas extends StatelessWidget {
  final String fakultas;

  const Fakultas({Key? key, required this.fakultas}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fakultas',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: screenHeight * 0.01),
        TextFormField(
           style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: fakultas,
            filled: true,
            fillColor: const Color(0xFFF6F7FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black),
            ),
            labelStyle: const TextStyle(
              color: Colors.black45,
            ),
          ),
        ),
      ],
    );
  }
}

class Username extends StatelessWidget {
  final String username;

  const Username({Key? key, required this.username}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        TextFormField(
          style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: username, // Tambahkan placeholder di sini
            filled: true,
            fillColor: const Color(0xFFF6F7FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black),
            ),
            labelStyle: const TextStyle(
              color: Colors.black45,
            ),
          ),
        ),
      ],
    );
  }
}
