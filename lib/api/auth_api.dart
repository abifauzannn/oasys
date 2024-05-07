import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oasys/models/user.dart';
import 'package:oasys/models/homepage.dart';
import 'package:oasys/models/rencana_studi.dart';

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

  static Future<HomePage?> getHomePage() async {
    try {
      final response = await http.get(
        Uri.parse('https://mobile.brainys.oasys.id/api/home'),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final infoMahasiswa = jsonData['data']['info_mahasiswa'];
        final programStudi = jsonData['data']['program_studi'];
        final semesterAktif = jsonData['data']['semester_aktif'];
        final dosenWali = jsonData['data']['dosen_wali'];
        final dosenPembimbing = jsonData['data']['dosen_pembimbing'];
        final statusKrs = jsonData['data']['status_krs'];
        final statusKhs = jsonData['data']['status_khs'];

        return HomePage(
            infoMahasiswa: InfoMahasiswa(
              id: infoMahasiswa['id'] ?? 0,
              nama: infoMahasiswa['nama'] ?? '',
              nim: infoMahasiswa['nim'] ?? '',
              ipk: infoMahasiswa['ipk'] ?? 0.0,
            ),
            programStudi: ProgramStudi(
              id: programStudi['id'] ?? 0,
              programStudi: programStudi['program_studi'] ?? '',
              fakultas: programStudi['fakultas'] ?? '',
              totalSks: programStudi['total_sks'] ?? 0,
            ),
            semesterAktif: SemesterAktif(
              id: semesterAktif['id'] ?? 0,
              kode: semesterAktif['kode'] ?? '',
              tanggalMulai: semesterAktif['tanggal_mulai'] ?? '',
              tanggalSelesai: semesterAktif['tanggal_selesai'] ?? '',
              namaSemester: semesterAktif['nama_semester'] ?? '',
              kodeTahun: semesterAktif['kode_tahun'] ?? '',
              tahunAwal: semesterAktif['tahun_awal'] ?? 0,
              tahunAkhir: semesterAktif['tahun_akhir'] ?? 0,
              statusNama: semesterAktif['status_nama'] ?? '',
            ),
            dosenWali: DosenWali(
              id: dosenWali['id'] ?? 0,
              dosenWali: dosenWali['nama_dosen'] ?? '',
            ),
            dosenPembimbing: DosenPembimbing(
              id: dosenPembimbing['id'] ?? 0,
              dosenPembimbing: dosenPembimbing['nama_dosen'] ?? '',
            ),
            statusKrs: StatusKrs(
              namaStatusKrs: statusKrs['nama_status_krs'] ?? '',
            ),
            statusKhs: StatusKhs(
              namaStatusKhs : statusKhs['nama_status_khs'] ?? '',
            )
            );
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<AcademicRencanaStudi?> getRencanaStudi() async {
  try {
    final response = await http.get(
      Uri.parse('https://mobile.brainys.oasys.id/api/academic/rencana-studi'),
      headers: {
        'Authorization': 'Bearer $_token',
      }
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final rencanaStudiInfo = jsonData['data']['rencana_studi_info'];
      final semesterAktif = jsonData['data']['semester_aktif'];
      final daftarMatkulJson = jsonData['data']['rencana_studi'];

      // Buat daftar mata kuliah dari JSON
      List<DaftarMatkul> daftarMatkul = [];
      for (var matkulJson in daftarMatkulJson) {
        DaftarMatkul matkul = DaftarMatkul(
          idPilihMatkulMhs: matkulJson['id_pilih_matkul_mhs'],
          idMatkul: matkulJson['id_matkul'],
          namaMatkul: matkulJson['nama_matkul'],
          kodeMatkul: matkulJson['kode_matkul'],
          sksMatkul: matkulJson['sks_matkul'],
        );
        daftarMatkul.add(matkul);
      }

      return AcademicRencanaStudi(
        rencanaStudiInfo: RencanaStudiInfo(
          sksDiAmbil: rencanaStudiInfo['sks_diambil'] ?? '',
          sksSelesai: rencanaStudiInfo['sks_selesai'] ?? '',
          sksTotal: rencanaStudiInfo['sks_total'] ?? '',
        ),
        semesterAktif: SemesterAktifAcademic(
          id: semesterAktif['id'] ?? 0,
          kode: semesterAktif['kode'] ?? '',
          namaSemester: semesterAktif['nama_semester'] ?? '',
          tahunAwal: semesterAktif['tahun_awal'] ?? '',
          tahunAkhir: semesterAktif['tahun_akhir'] ?? '',
          statusSemester: semesterAktif['status_semester'] ?? '',
        ),
        daftarMatkul: daftarMatkul,
      );
    } else {
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

}
