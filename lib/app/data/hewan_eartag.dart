class EartagHewan {
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  String kodeEartagNasional;
  String noKartuTernak;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String desa;
  String spesies;
  String sex;
  String umur;
  String identifikasiHewan;
  String petugasPendaftar;
  String tanggalTerdaftar;
  String fotoHewan;
  String latitude;
  String longitude;

  EartagHewan({
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.kodeEartagNasional,
    required this.noKartuTernak,
    required this.provinsi,
    required this.kabupaten,
    required this.kecamatan,
    required this.desa,
    required this.spesies,
    required this.sex,
    required this.umur,
    required this.identifikasiHewan,
    required this.petugasPendaftar,
    required this.tanggalTerdaftar,
    required this.fotoHewan,
    required this.latitude,
    required this.longitude,
  });

  factory EartagHewan.fromJson(Map<String, dynamic> json) => EartagHewan(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        kodeEartagNasional: json['kodeEartagNasional'],
        noKartuTernak: json['noKartuTernak'],
        provinsi: json['provinsi'],
        kabupaten: json['kabupaten'],
        kecamatan: json['kecamatan'],
        desa: json['desa'],
        spesies: json['spesies'],
        sex: json['sex'],
        umur: json['umur'],
        identifikasiHewan: json['identifikasiHewan'],
        petugasPendaftar: json['petugasPendaftar'],
        tanggalTerdaftar: json['tanggalTerdaftar'],
        fotoHewan: json['fotoHewan'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
}
