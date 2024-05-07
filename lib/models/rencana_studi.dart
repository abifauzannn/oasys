class AcademicRencanaStudi {
  // final Mahasiswa mahasiswa;
  final RencanaStudiInfo rencanaStudiInfo;
  final SemesterAktifAcademic semesterAktif;
  final List<DaftarMatkul> daftarMatkul;

  AcademicRencanaStudi({
    // required this.mahasiswa,
    required this.rencanaStudiInfo,
    required this.semesterAktif,
    required this.daftarMatkul,
    // required this.rencanaStudi,
  });

  factory AcademicRencanaStudi.fromJson(Map<String, dynamic> json) {
    return AcademicRencanaStudi(
      // mahasiswa: Mahasiswa.fromJson(json['mahasiswa']),
      rencanaStudiInfo: RencanaStudiInfo.fromJson(json['rencana_studi_info']),
      semesterAktif: SemesterAktifAcademic.fromJson(json['semester_aktif']),
       daftarMatkul: List<DaftarMatkul>.from(json['rencana_studi'].map((matkulJson) {
        return DaftarMatkul.fromJson(matkulJson);
      })),
      // rencanaStudi: RencanaStudi.fromJson(json['rencana_studi']),
    );
  }
}

class DaftarMatkul {
  final int idPilihMatkulMhs;
  final int idMatkul;
  final String namaMatkul;
  final String kodeMatkul;
  final int sksMatkul;

  DaftarMatkul({
    required this.idPilihMatkulMhs,
    required this.idMatkul,
    required this.namaMatkul,
    required this.kodeMatkul,
    required this.sksMatkul,
  });

  factory DaftarMatkul.fromJson(Map<String, dynamic> json) {
    return DaftarMatkul(
      idPilihMatkulMhs: json['id_pilih_matkul_mhs'],
      idMatkul: json['id_matkul'],
      namaMatkul: json['nama_matkul'],
      kodeMatkul: json['kode_matkul'],
      sksMatkul: json['sks_matkul'],
    );
  }
}

class SemesterAktifAcademic {
  final int id;
  final String kode;
  final String namaSemester;
  final String tahunAwal;
  final String tahunAkhir;
  final String statusSemester;

  SemesterAktifAcademic({
    required this.id,
    required this.kode,
    required this.namaSemester,
    required this.tahunAwal,
    required this.tahunAkhir,
    required this.statusSemester,
  });

  factory SemesterAktifAcademic.fromJson(Map<String, dynamic> json) {
    return SemesterAktifAcademic(
      id: json['id'],
      kode: json['kode'],
      namaSemester: json['nama_semester'],
      tahunAwal: json['tahun_awal'],
      tahunAkhir: json['tahun_akhir'],
      statusSemester: json['status_semester'],
    );
  }
}

// class Mahasiswa {
//   final String nama;
//   final String nim;

//   Mahasiswa({
//     required this.nama,
//     required this.nim,
//   });

//   factory Mahasiswa.fromJson(Map<String, dynamic> json) {
//     return Mahasiswa(
//       nama: json['nama'],
//       nim: json['nim'],
//     );
//   }
// }

class RencanaStudiInfo {
  final String sksDiAmbil;
  final String sksSelesai;
  final String sksTotal;

  RencanaStudiInfo({
    required this.sksDiAmbil,
    required this.sksSelesai,
    required this.sksTotal,
  });

  factory RencanaStudiInfo.fromJson(Map<String, dynamic> json) {
    return RencanaStudiInfo(
      sksDiAmbil: json['sks_diambil'],
      sksSelesai: json['sks_selesai'],
      sksTotal: json['sks_total'],
    );
  }
}

// class RencanaStudi {
//   final int idPilihMatkulMhs;
//   final int idMatkul;
//   final String namaMatkul;
//   final String kodeMatkul;
//   final int sksMatkul;

//   RencanaStudi({
//     required this.idPilihMatkulMhs,
//     required this.idMatkul,
//     required this.namaMatkul,
//     required this.kodeMatkul,
//     required this.sksMatkul,
//   });

//   factory RencanaStudi.fromJson(Map<String, dynamic> json) {
//     return RencanaStudi(
//       idPilihMatkulMhs: json['id_pilih_matkul_mhs'],
//       idMatkul: json['id_matkul'],
//       namaMatkul: json['nama_matkul'],
//       kodeMatkul: json['kode_matkul'],
//       sksMatkul: json['sks_matkul'],
//     );
//   }
// }