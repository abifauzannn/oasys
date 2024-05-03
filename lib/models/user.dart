class LoginResult {
  final String message;
  final String token;
  final String username;
  final int mahasiswaId;

  LoginResult({
    required this.message,
    required this.token,
    required this.username,
    required this.mahasiswaId,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      message: json['message'],
      token: json['token'],
      username: json['username'],
      mahasiswaId: json['mahasiswa_id'],
    );
  }
}

class UserProfile {
  final String photo;
  final String name;
  final String nim;
  final int entryYear;
  final String studyProgram;
  final String faculty;
  final String username;

  UserProfile({
    required this.photo, // Provide a non-null default value
    required this.name, // Mark other parameters as required
    required this.nim,
    required this.entryYear,
    required this.studyProgram,
    required this.faculty,
    required this.username,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    final profileData = json['data']['profile_mahasiswa'];
    final detailData = json['data']['detil_mahasiswa'];

    return UserProfile(
      photo: profileData['foto'] ?? '',
      name: profileData['nama'] ?? '',
      nim: profileData['nim'] ?? '',
      entryYear: detailData['tahun_masuk'] ?? 0,
      studyProgram: detailData['program_studi'] ?? '',
      faculty: detailData['fakultas'] ?? '',
      username: detailData['username'] ?? '',
    );
  }
}
