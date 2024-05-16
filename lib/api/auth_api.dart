import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oasys/models/pengumuman.dart';
import 'package:oasys/models/user.dart';
import 'package:oasys/models/homepage.dart';
import 'package:oasys/models/rencana_studi.dart';
import 'package:oasys/models/kehadiran.dart';
import 'package:oasys/models/jadwal.dart';
import 'package:oasys/models/nilai.dart';
import 'package:oasys/models/passwordchange.dart';
import 'package:oasys/models/forgetpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

        // Simpan token ke penyimpanan lokal
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', _token);

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
      // Memuat token dari penyimpanan lokal
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');

      final response = await http.get(
        Uri.parse('https://mobile.brainys.oasys.id/api/profile'),
        headers: {
          'Authorization':
              'Bearer $savedToken', // Menggunakan token yang tersimpan
        },
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
          photoNew: profileData['foto_new'] ?? '',
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');

      final response = await http.get(
        Uri.parse('https://mobile.brainys.oasys.id/api/home'),
        headers: {
          'Authorization': 'Bearer $savedToken',
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
              namaStatusKhs: statusKhs['nama_status_khs'] ?? '',
            ));
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');

      final response = await http.get(
          Uri.parse(
              'https://mobile.brainys.oasys.id/api/academic/rencana-studi'),
          headers: {
            'Authorization': 'Bearer $savedToken',
          });

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

  static Future<Kehadiran?> getKehadiran() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');
      final response = await http.get(
          Uri.parse('https://mobile.brainys.oasys.id/api/academic/kehadiran'),
          headers: {
            'Authorization': 'Bearer $savedToken',
          });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final semesterAktif = jsonData['data']['semester_aktif'];
        final daftarKehadiranJson = jsonData['data']['kehadiran'];

        // Buat daftar mata kuliah dari JSON
        List<KehadiranDetail> daftarKehadiran = [];
        for (var kehadiranJson in daftarKehadiranJson) {
          KehadiranDetail kehadiran = KehadiranDetail(
            idMahasiswa: kehadiranJson['id_mahasiswa'] ?? 0,
            namaMahasiswa: kehadiranJson['nama_mahasiswa'] ?? '',
            jumlahTotal: kehadiranJson['jumlah_kehadiran_total'] ?? 0,
            jumlahHadir: kehadiranJson['jumlah_kehadiran_hadir'] ?? '',
            idMatkul: kehadiranJson['id_matkul'] ?? 0,
            namaMatkul: kehadiranJson['nama_matkul'] ?? '',
            presentaseKehadiran: kehadiranJson['presentase_kehadiran'] ?? '',
          );
          daftarKehadiran.add(kehadiran);
        }

        return Kehadiran(
          semesterAktif: SemesterAktifKehadiran(
            id: semesterAktif['id'] ?? 0,
            kode: semesterAktif['kode'] ?? '',
            namaSemester: semesterAktif['nama_semester'] ?? '',
            tahunAwal: semesterAktif['tahun_awal'] ?? '',
            tahunAkhir: semesterAktif['tahun_akhir'] ?? '',
            statusSemester: semesterAktif['status_semester'] ?? '',
          ),
          daftarKehadiran: daftarKehadiran,
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<Jadwal?> getJadwal() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');
      final response = await http.get(
          Uri.parse(
              'https://mobile.brainys.oasys.id/api/academic/jadwal-kelas'),
          headers: {
            'Authorization': 'Bearer $savedToken,',
          });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final daftarJadwalJson = jsonData['data']['jadwal_kelas'];

        // Buat daftar mata kuliah dari JSON
        List<JadwalDetail> daftarJadwal = [];
        for (var jadwalJson in daftarJadwalJson) {
          JadwalDetail jadwal = JadwalDetail(
            namaHari: jadwalJson['nama_hari'] ?? '',
            idRuangan: jadwalJson['id_ruangan'] ?? '',
            jamKuliah: jadwalJson['jam_kuliah'] ?? '',
            namaMatkul: jadwalJson['nama_matkul'] ?? '',
            namaDosen: jadwalJson['nama_dosen'] ?? '',
          );
          daftarJadwal.add(jadwal);
        }

        return Jadwal(
          daftarJadwal: daftarJadwal,
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<Nilai?> getNilai() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');

      final response = await http.get(
        Uri.parse('https://mobile.brainys.oasys.id/api/academic/nilai'),
        headers: {
          'Authorization': 'Bearer $savedToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Extracting data from JSON
        final mahasiswaData = jsonData['data']['mahasiswa'];
        final semesterAktifData = jsonData['data']['semester_aktif'];
        final penilaianInfoData = jsonData['data']['penilaian_info'];
        final penilaianData = jsonData['data']['penilaian'];

        // Creating Mahasiswa object
        final mahasiswa = Mahasiswa.fromJson(mahasiswaData);

        // Creating SemesterAktif object
        final semesterAktif = SemesterAktifNilai.fromJson(semesterAktifData);

        // Creating PenilaianInfo object
        final penilaianInfo = PenilaianInfo.fromJson(penilaianInfoData);

        // Creating List of NilaiDetail objects
        List<NilaiDetail> daftarNilai = [];
        for (var nilaiJson in penilaianData) {
          NilaiDetail nilai = NilaiDetail.fromJson(nilaiJson);
          daftarNilai.add(nilai);
        }

        // Creating Nilai object
        final nilai = Nilai(
          mahasiswa: mahasiswa,
          semesterAktif: semesterAktif,
          penilaianInfo: penilaianInfo,
          penilaian: daftarNilai,
        );

        return nilai;
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<List<PengumumanDetail>> getPengumuman() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');

      final response = await http.get(
        Uri.parse('https://mobile.brainys.oasys.id/api/pengumuman'),
        headers: {
          'Authorization': 'Bearer $savedToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Memeriksa apakah ada kunci 'data' dalam respons
        if (jsonData.containsKey('data')) {
          List<dynamic> pengumumanData = jsonData['data'];
          List<PengumumanDetail> pengumumanList = pengumumanData
              .map((data) => PengumumanDetail.fromJson(data))
              .toList();
          return pengumumanList;
        } else {
          // Jika tidak ada kunci 'data' dalam respons, kembalikan daftar kosong
          return [];
        }
      } else {
        // Return an empty list in case of error
        return [];
      }
    } catch (e) {
      print('Error: $e');
      // Return an empty list in case of error
      return [];
    }
  }

  static Future<bool> logout() async {
    try {
      // Memuat token dari penyimpanan lokal
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');

      final response = await http.post(
        Uri.parse('https://mobile.brainys.oasys.id/api/logout'),
        headers: {
          'Authorization': 'Bearer $savedToken'
        }, // Menggunakan token yang tersimpan
      );

      if (response.statusCode == 200) {
        // Logout berhasil, hapus token yang disimpan
        await prefs.remove('token');
        return true;
      } else {
        // Handle kegagalan logout
        return false;
      }
    } catch (e) {
      // Tangani kesalahan jaringan atau pengecualian lainnya
      print('Error: $e');
      return false;
    }
  }

  

   static Future<PasswordChange> changePassword(String currentPassword, String newPassword, String confirmPassword) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('token');
    final response = await http.post(
      Uri.parse('https://mobile.brainys.oasys.id/api/change-password'),
      headers: {
        'Authorization': 'Bearer $_token || Bearer $savedToken',
      },
      body: {
        'current_password': currentPassword,
        'new_password': newPassword,
        'confirm_password': confirmPassword,
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _token = jsonData['token'] ?? ''; // Simpan token setelah login berhasil
      return PasswordChange(
        message: jsonData['message'] ?? '',
      );
    } else if (response.statusCode == 429) {
      // Handle Too Many Requests error
      // Implement exponential backoff strategy
      return await _retryChangePassword(currentPassword, newPassword, confirmPassword);
    } else {
      final jsonData = json.decode(response.body);
      return PasswordChange(
        message: jsonData['message'] ?? '',
      );
    }
  } catch (e) {
    return PasswordChange(
      message: 'Error: $e',
    );
  }
}

static Future<PasswordChange> _retryChangePassword(String currentPassword, String newPassword, String confirmPassword) async {
  await Future.delayed(Duration(seconds: 3)); // Wait for 5 seconds
  // Retry the password change request
  return await changePassword(currentPassword, newPassword, confirmPassword);
}


  static Future<ForgetPassword> forgetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse('https://mobile.brainys.oasys.id/api/forgot-password'),
        headers: <String, String>{
          'Content-Type': 'application/json', // Set content type to JSON
        },
        body: jsonEncode(<String, String>{
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _token = jsonData['token'] ?? ''; // Simpan token setelah login berhasil
        return ForgetPassword(
            message: jsonData['message'] ?? '',
            status: jsonData['status'] ?? '',
            reset_token: jsonData['reset_token'] ?? '');
      } else {
        final jsonData = json.decode(response.body);
        return ForgetPassword(
          message: jsonData['message'] ?? '',
          reset_token: '',
          status: '',
        );
      }
    } catch (e) {
      return ForgetPassword(
        message: 'Error: $e',
        reset_token: '',
        status: '',
      );
    }
  }
}
