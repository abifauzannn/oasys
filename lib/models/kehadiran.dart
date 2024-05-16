class Kehadiran {
  final SemesterAktifKehadiran semesterAktif;
  final List<KehadiranDetail> daftarKehadiran;

  Kehadiran({
    required this.semesterAktif,
    required this.daftarKehadiran,
  });

  factory Kehadiran.fromJson(Map<String, dynamic> json) {
    final semesterAktifData = json['data']['semester_aktif'];
    final daftarKehadiranData = json['kehadiran'];

    final semesterAktif = SemesterAktifKehadiran(
      id: semesterAktifData['id'],
      kode: semesterAktifData['kode'],
      namaSemester: semesterAktifData['nama_semester'],
      tahunAwal: semesterAktifData['tahun_awal'],
      tahunAkhir: semesterAktifData['tahun_akhir'],
      statusSemester: semesterAktifData['status_semester'],
    );

    final daftarKehadiran = List<KehadiranDetail>.from(daftarKehadiranData.map((kehadiranJson) {
      return KehadiranDetail.fromJson(kehadiranJson);
    }));

    return Kehadiran(
      semesterAktif: semesterAktif,
      daftarKehadiran: daftarKehadiran,
    );
  }
}

class SemesterAktifKehadiran {
  final int id;
  final String kode;
  final String namaSemester;
  final String tahunAwal;
  final String tahunAkhir;
  final String statusSemester;

  SemesterAktifKehadiran({
    required this.id,
    required this.kode,
    required this.namaSemester,
    required this.tahunAwal,
    required this.tahunAkhir,
    required this.statusSemester,
  });
}

class KehadiranDetail {
  final int idMahasiswa;
  final String namaMahasiswa;
  final int idMatkul;
  final String namaMatkul;
  final int jumlahTotal;
  final String jumlahHadir;
  final String presentaseKehadiran;

  KehadiranDetail({
    required this.idMahasiswa,
    required this.namaMahasiswa,
    required this.idMatkul,
    required this.namaMatkul,
    required this.jumlahTotal,
    required this.jumlahHadir,
    required this.presentaseKehadiran,
  });

  factory KehadiranDetail.fromJson(Map<String, dynamic> json) {
    return KehadiranDetail(
      idMahasiswa: json['id_mahasiswa'],
      namaMahasiswa: json['nama_mahasiswa'],
      idMatkul: json['id_matkul'],
      namaMatkul: json['nama_matkul'],
      jumlahTotal: json['jumlah_total_kehadiran'],
      jumlahHadir: json['jumlah_kehadiran_hadir'],
      presentaseKehadiran: json['presentase_kehadiran'],
    );
  }
}
