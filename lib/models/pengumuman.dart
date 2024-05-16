class PengumumanDetail {
  final int id;
  final String judul;
  final String isi;
  final String date;

  PengumumanDetail({
    required this.id,
    required this.judul,
    required this.isi,
    required this.date,
  });

  factory PengumumanDetail.fromJson(Map<String, dynamic> json) {
    return PengumumanDetail(
      id: json['id'],
      judul: json['judul'],
      isi: json['isi'],
      date: json['date'],
    );
  }
}