class Jadwal {
  final List<JadwalDetail> daftarJadwal;

  Jadwal({
    required this.daftarJadwal,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    final daftarJadwalData = json['kehadiran'];

    final daftarJadwal = List<JadwalDetail>.from(daftarJadwalData.map((jadwalJson) {
      return JadwalDetail.fromJson(jadwalJson);
    }));

    return Jadwal(
    daftarJadwal: daftarJadwal,
    );
  }
}

class JadwalDetail {
  final String namaHari;
  final String idRuangan;
  final String jamKuliah;
  final String namaMatkul;
  final String namaDosen;

  JadwalDetail({
    required this.namaHari,
    required this.idRuangan,
    required this.jamKuliah,
    required this.namaMatkul,
    required this.namaDosen,
  });

  factory JadwalDetail.fromJson(Map<String, dynamic> json) {
    return JadwalDetail(
      namaHari: json['nama_hari'] ?? '',
      idRuangan: json['id_ruangan'] ?? '',
      jamKuliah: json['jam_kuliah'] ?? '',
      namaMatkul: json['nama_matkul'] ?? '',
      namaDosen: json['nama_dosen'] ?? '',
    );
  }
}