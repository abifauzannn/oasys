import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oasys/models/user.dart';

class AuthApi {
  static String _token =
      ''; // Token akan disimpan di sini setelah login berhasil

  static Future<LoginResult> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://mobile.brainys.oasys.id/api/login'),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _token = jsonData['token'] ?? ''; // Simpan token setelah login berhasil
        return LoginResult(
          message: jsonData['message'] ?? '',
          token: _token,
          username: jsonData['username'] ?? '',
          mahasiswaId: jsonData['mahasiswa_id'] ?? 0,
        );
      } else {
        final jsonData = json.decode(response.body);
        return LoginResult(
          message: jsonData['message'] ?? '',
          token: '',
          username: '',
          mahasiswaId: 0,
        );
      }
    } catch (e) {
      return LoginResult(
        message: 'Error: $e',
        token: '',
        username: '',
        mahasiswaId: 0,
      );
    }
  }

  static Future<UserProfile?> getProfile() async {
    try {
      final response = await http.get(
        Uri.parse('https://mobile.brainys.oasys.id/api/profile'),
        headers: {
          'Authorization': 'Bearer $_token'
        }, // Using authorization token
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final profileData = jsonData['data']['profile_mahasiswa'];
        final detailData = jsonData['data']['detil_mahasiswa'];

        return UserProfile(
          photo: profileData['foto'] ?? '',
          name: profileData['nama'] ?? '',
          nim: profileData['nim'] ?? '',
          entryYear: detailData['tahun_masuk'] ?? 0,
          studyProgram: detailData['program_studi'] ?? '',
          faculty: detailData['fakultas'] ?? '',
          username: detailData['username'] ?? '',
        );
      } else {
        // Handle unexpected status code or null data
        return null;
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request
      return null;
    }
  }
}
