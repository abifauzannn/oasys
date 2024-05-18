import 'package:flutter/material.dart';
import 'package:oasys/theme/theme.dart';
import 'package:oasys/widgets/customWidget.dart';
import '../../api/auth_api.dart';
import '../../models/user.dart';

class FormProfile extends StatefulWidget {
  const FormProfile({Key? key}) : super(key: key);

  @override
  _FormProfileState createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  late Future<UserProfile?> _profileFuture;
  TextEditingController tahunMasukController = TextEditingController();
  TextEditingController programStudiController = TextEditingController();
  TextEditingController fakultasController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _profileFuture = AuthApi.getProfile();
  }

  Future<void> _refreshProfile() async {
    setState(() {
      _profileFuture = AuthApi.getProfile();
    });
  }

  @override
  void dispose() {
    tahunMasukController.dispose();
    programStudiController.dispose();
    fakultasController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfile?>(
      future: _profileFuture,
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
          final profile = snapshot.data!;
          tahunMasukController.text = profile.entryYear.toString();
          programStudiController.text = profile.studyProgram;
          fakultasController.text = profile.faculty;
          usernameController.text = profile.username;
          return _buildProfileForm(context, profile);
        } else {
          return Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }

  Widget _buildProfileForm(BuildContext context, UserProfile profile) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          CustomTextFormField(
            title: 'Tahun Masuk',
            controller: tahunMasukController,
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomTextFormField(
            title: 'Program Studi',
            controller: programStudiController,
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomTextFormField(
            title: 'Fakultas',
            controller: fakultasController,
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomTextFormField(
            title: 'Username',
            controller: usernameController,
          ),
          // TahunMasuk(tahunMasuk: profile.entryYear.toString()),
          // SizedBox(height: screenHeight * 0.02),
          // ProgramStudi(programStudi: profile.studyProgram),
          // SizedBox(height: screenHeight * 0.02),
          // Fakultas(fakultas: profile.faculty),
          // SizedBox(height: screenHeight * 0.02),
          // Username(username: profile.username),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tahun Masuk',
          style: style1,
        ),
        SizedBox(height: screenHeight * 0.01),
        TextFormField(
          initialValue: tahunMasuk,
          style: style1,
          decoration: decoration1,
        ),
      ],
    );
  }
}

// Implement ProgramStudi, Fakultas, and Username similarly as TahunMasuk

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
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
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
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
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
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
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
