

class Nilai {
  final Mahasiswa mahasiswa;
  final SemesterAktifNilai semesterAktif;
  final PenilaianInfo penilaianInfo;
  final List<NilaiDetail> penilaian;

  Nilai({
    required this.mahasiswa,
    required this.semesterAktif,
    required this.penilaianInfo,
    required this.penilaian,
  });

  factory Nilai.fromJson(Map<String, dynamic> json) {
    return Nilai(
      mahasiswa: Mahasiswa.fromJson(json['data']['mahasiswa']),
      semesterAktif: SemesterAktifNilai.fromJson(json['data']['semester_aktif']),
      penilaianInfo: PenilaianInfo.fromJson(json['data']['penilaian_info']),
      penilaian: List<NilaiDetail>.from(json['data']['penilaian'].map((x) => NilaiDetail.fromJson(x))),
    );
  }
}

class Mahasiswa {
  final String nama;
  final String nim;

  Mahasiswa({
    required this.nama,
    required this.nim,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      nama: json['nama'],
      nim: json['nim'],
    );
  }
}

class SemesterAktifNilai {
  final int id;
  final String kode;
  final String namaSemester;
  final String tahunAwal;
  final String tahunAkhir;
  final String statusSemester;

  SemesterAktifNilai({
    required this.id,
    required this.kode,
    required this.namaSemester,
    required this.tahunAwal,
    required this.tahunAkhir,
    required this.statusSemester,
  });

  factory SemesterAktifNilai.fromJson(Map<String, dynamic> json) {
    return SemesterAktifNilai(
      id: json['id'],
      kode: json['kode'],
      namaSemester: json['nama_semester'],
      tahunAwal: json['tahun_awal'],
      tahunAkhir: json['tahun_akhir'],
      statusSemester: json['status_semester'],
    );
  }
}

class PenilaianInfo {
  final double ips;
  final double ipk;
  final int nilaiRata;

  PenilaianInfo({
    required this.ips,
    required this.ipk,
    required this.nilaiRata,
  });

  factory PenilaianInfo.fromJson(Map<String, dynamic> json) {
    return PenilaianInfo(
      ips: json['ips'],
      ipk: json['ipk'],
      nilaiRata: json['nilai_rata'],
    );
  }
}

class NilaiDetail {
  final int idMahasiswa;
  final String nama;
  final int idSemester;
  final int idPilihMatkulMhs;
  final int idMatkul;
  final String namaMatkul;
  final String kodeMatkul;
  final int sksMatkul;
  // final Float nilaiAkhir;
  // final Float nilaiIndeks;
  final String hurufIndeks;

  NilaiDetail({
    required this.idMahasiswa,
    required this.nama,
    required this.idSemester,
    required this.idPilihMatkulMhs,
    required this.idMatkul,
    required this.namaMatkul,
    required this.kodeMatkul,
    required this.sksMatkul,
    // required this.nilaiAkhir,
    // required this.nilaiIndeks,
    required this.hurufIndeks,
  });

  factory NilaiDetail.fromJson(Map<String, dynamic> json) {
    return NilaiDetail(
      idMahasiswa: json['id_mahasiswa'] ?? 0,
      nama: json['nama'] ?? '',
      idSemester: json['id_semester'] ?? 0,
      idPilihMatkulMhs: json['id_pilih_matkul_mhs'] ?? 0,
      idMatkul: json['id_matkul'] ?? 0,
      namaMatkul: json['nama_matkul'] ?? '',
      kodeMatkul: json['kode_matkul'] ?? '',
      sksMatkul: json['sks_matkul'] ?? 0,
      // nilaiAkhir: json['nilai_akhir'] ?? 0.0,
      // nilaiIndeks: json['nilai_indeks'] ?? 0.0,
      hurufIndeks: json['huruf_indeks'] ?? '',
    );
  }
}
