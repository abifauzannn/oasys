class HomePage {
  final InfoMahasiswa infoMahasiswa;
  final ProgramStudi programStudi;
  final SemesterAktif semesterAktif;
  final DosenWali dosenWali;
  final DosenPembimbing dosenPembimbing;
  final StatusKrs statusKrs;
  final StatusKhs statusKhs;

  HomePage({
    required this.infoMahasiswa,
    required this.programStudi,
    required this.semesterAktif,
    required this.dosenWali,
    required this.dosenPembimbing,
    required this.statusKrs,
    required this.statusKhs,
  });

  factory HomePage.fromJson(Map<String, dynamic> json) {
    return HomePage(
      infoMahasiswa: InfoMahasiswa.fromJson(json['info_mahasiswa']),
      programStudi: ProgramStudi.fromJson(json['program_studi']),
      semesterAktif: SemesterAktif.fromJson(json['semester_aktif']),
      dosenWali: DosenWali.fromJson(json['dosen_wali']),
      dosenPembimbing: DosenPembimbing.fromJson(json['dosen_pembimbing']),
      statusKrs: StatusKrs.fromJson(json['status_krs']),
      statusKhs: StatusKhs.fromJson(json['status_khs']),

    );
  }
}

class InfoMahasiswa {
  final int id;
  final String nama;
  final String nim;
  final double ipk;

  InfoMahasiswa({
    required this.id,
    required this.nama,
    required this.nim,
    required this.ipk,
  });

  factory InfoMahasiswa.fromJson(Map<String, dynamic> json) {
    return InfoMahasiswa(
      id: json['id'],
      nama: json['nama'],
      nim: json['nim'],
      ipk: json['ipk'],
    );
  }
}

class ProgramStudi {
  final int id;
  final String programStudi;
  final String fakultas;
  final int totalSks;

  ProgramStudi({
    required this.id,
    required this.programStudi,
    required this.fakultas,
    required this.totalSks,
  });

  factory ProgramStudi.fromJson(Map<String, dynamic> json) {
    return ProgramStudi(
      id: json['id'],
      programStudi: json['program_studi'],
      fakultas: json['fakultas'],
      totalSks: json['total_sks'],
    );
  }
}

class SemesterAktif {
  final int id;
  final String kode;
  final String tanggalMulai;
  final String tanggalSelesai;
  final String namaSemester;
  final String kodeTahun;
  final String tahunAwal;
  final String tahunAkhir;
  final String statusNama;

  SemesterAktif({
    required this.id,
    required this.kode,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.namaSemester,
    required this.kodeTahun,
    required this.tahunAwal,
    required this.tahunAkhir,
    required this.statusNama,
  });

  factory SemesterAktif.fromJson(Map<String, dynamic> json) {
    return SemesterAktif(
      id: json['id'],
      kode: json['kode'],
      tanggalMulai: json['tanggal_mulai'],
      tanggalSelesai: json['tanggal_selesai'],
      kodeTahun: json['kode_tahun'],
      namaSemester: json['nama_semester'],
      tahunAwal: json['tahun_awal'],
      tahunAkhir: json['tahun_akhir'],
      statusNama: json['status_nama'],
    );
  }
}

class DosenWali {
  final int id;
  final String dosenWali;

  DosenWali({
    required this.id,
    required this.dosenWali,
  });

  factory DosenWali.fromJson(Map<String, dynamic> json) {
    return DosenWali(
      id: json['id'],
      dosenWali: json['nama_dosen'],
    );
  }
}

class DosenPembimbing {
  final int id;
  final String dosenPembimbing;

  DosenPembimbing({
    required this.id,
    required this.dosenPembimbing,
  });

  factory DosenPembimbing.fromJson(Map<String, dynamic> json) {
    return DosenPembimbing(
      id: json['id'],
      dosenPembimbing: json['nama_dosen'],
    );
  }
}

class StatusKrs {
  final String namaStatusKrs;

  StatusKrs({
    required this.namaStatusKrs,
  });

  factory StatusKrs.fromJson(Map<String, dynamic> json) {
    return StatusKrs(
      namaStatusKrs: json['nama_status_krs'],
    );
  }
}

class StatusKhs {
  final String namaStatusKhs;

  StatusKhs({
    required this.namaStatusKhs,
  });

  factory StatusKhs.fromJson(Map<String, dynamic> json) {
    return StatusKhs(
      namaStatusKhs: json['nama_status_khs'],
    );
  }
}
