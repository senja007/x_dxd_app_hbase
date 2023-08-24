class PostModel {
  final int? id;
  final String? namaPetugas;
  final String? nikPetugas;
  final String? noTelp;
  final String? email;
  final int? status;

  PostModel({
    this.status,
    this.id,
    this.namaPetugas,
    this.nikPetugas,
    this.noTelp,
    this.email,
  });

  factory PostModel.fromJson(Map<String, dynamic> jsonData) {
    return PostModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      namaPetugas:
          jsonData['namaPetugas'] != null ? jsonData['namaPetugas'] : "",
      nikPetugas: jsonData['nikPetugas'] != null ? jsonData['nikPetugas'] : "",
      noTelp: jsonData['noTelp'] != null ? jsonData['noTelp'] : "",
      email: jsonData['email'] != null ? jsonData['email'] : "",
    );
  }
}

class PostListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<PostModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  PostListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory PostListModel.fromJson(Map<String, dynamic> jsonData) {
    return PostListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<PostModel>((data) => PostModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}





// Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

// String usermodelToJson(Usermodel data) => json.encode(data.toJson());

// class Usermodel {
//   List<Content> namaPetugas;
//   int nikPetugas;
//   int noTelp;
//   int email;
//   int totalPages;
//   bool last;
//   int statusCode;

//   Usermodel({
//     this.namaPetugas,
//     this.nikPetugas,
//     this.noTelp,
//     this.email,
//     this.totalPages,
//     this.last,
//     this.statusCode,
//   });

//   factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
//         namaPetugas:
//             List<Content>.from(json["namaPetugas"].map((x) => Content.fromJson(x))),
//         nikPetugas: json["nikPetugas"],
//         noTelp: json["noTelp"],
//         email: json["email"],
//         totalPages: json["totalPages"],
//         last: json["last"],
//         statusCode: json["statusCode"],
//       );

//   Map<String, dynamic> toJson() => {
//         "namaPetugas": List<dynamic>.from(namaPetugas.map((x) => x.toJson())),
//         "nikPetugas": nikPetugas,
//         "noTelp": noTelp,
//         "email": email,
//         "totalPages": totalPages,
//         "last": last,
//         "statusCode": statusCode,
//       };
// }

// class Content {
//   int id;
//   int noKartuTernak;
//   String kodeEartagNasional;
//   Provinsi provinsi;
//   Kabupaten kabupaten;
//   Kecamatan kecamatan;
//   String desa;
//   String namaPeternak;
//   String idPeternak;
//   String nikPeternak;
//   Spesies spesies;
//   Sex sex;
//   String umur;
//   String identifikasiHewan;
//   PetugasPendaftar petugasPendaftar;
//   String tanggalTerdaftar;
//   DateTime updatedAt;
//   DateTime createdAt;

//   Content({
//     this.id,
//     this.noKartuTernak,
//     this.kodeEartagNasional,
//     this.provinsi,
//     this.kabupaten,
//     this.kecamatan,
//     this.desa,
//     this.namaPeternak,
//     this.idPeternak,
//     this.nikPeternak,
//     this.spesies,
//     this.sex,
//     this.umur,
//     this.identifikasiHewan,
//     this.petugasPendaftar,
//     this.tanggalTerdaftar,
//     this.updatedAt,
//     this.createdAt,
//   });

//   factory Content.fromJson(Map<String, dynamic> json) => Content(
//         id: json["id"],
//         noKartuTernak: json["noKartuTernak"],
//         kodeEartagNasional: json["kodeEartagNasional"],
//         provinsi: provinsiValues.map[json["provinsi"]],
//         kabupaten: kabupatenValues.map[json["kabupaten"]],
//         kecamatan: kecamatanValues.map[json["kecamatan"]],
//         desa: json["desa"],
//         namaPeternak: json["namaPeternak"],
//         idPeternak: json["idPeternak"],
//         nikPeternak: json["nikPeternak"],
//         spesies: spesiesValues.map[json["spesies"]],
//         sex: sexValues.map[json["sex"]],
//         umur: json["umur"],
//         identifikasiHewan: json["identifikasiHewan"],
//         petugasPendaftar: petugasPendaftarValues.map[json["petugasPendaftar"]],
//         tanggalTerdaftar: json["tanggalTerdaftar"],
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "noKartuTernak": noKartuTernak,
//         "kodeEartagNasional": kodeEartagNasional,
//         "provinsi": provinsiValues.reverse[provinsi],
//         "kabupaten": kabupatenValues.reverse[kabupaten],
//         "kecamatan": kecamatanValues.reverse[kecamatan],
//         "desa": desa,
//         "namaPeternak": namaPeternak,
//         "idPeternak": idPeternak,
//         "nikPeternak": nikPeternak,
//         "spesies": spesiesValues.reverse[spesies],
//         "sex": sexValues.reverse[sex],
//         "umur": umur,
//         "identifikasiHewan": identifikasiHewan,
//         "petugasPendaftar": petugasPendaftarValues.reverse[petugasPendaftar],
//         "tanggalTerdaftar": tanggalTerdaftar,
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdAt": createdAt.toIso8601String(),
//       };
// }

// enum Kabupaten { LUMAJANG }

// final kabupatenValues = EnumValues({"Lumajang": Kabupaten.LUMAJANG});

// enum Kecamatan { KEDUNGJAJANG, YOSOWILANGUN }

// final kecamatanValues = EnumValues({
//   "Kedungjajang": Kecamatan.KEDUNGJAJANG,
//   "Yosowilangun": Kecamatan.YOSOWILANGUN
// });

// enum PetugasPendaftar {
//   BUDI_MULYONO,
//   FIBRI_ARIANTO,
//   RUDI_DARMAWAN,
//   SETO_ADJUKRI,
//   SUPRIYANTO
// }

// final petugasPendaftarValues = EnumValues({
//   "Budi Mulyono": PetugasPendaftar.BUDI_MULYONO,
//   "Fibri Arianto": PetugasPendaftar.FIBRI_ARIANTO,
//   "Rudi Darmawan": PetugasPendaftar.RUDI_DARMAWAN,
//   "Seto Adjukri": PetugasPendaftar.SETO_ADJUKRI,
//   "Supriyanto": PetugasPendaftar.SUPRIYANTO
// });

// enum Provinsi { JAWA_TIMUR }

// final provinsiValues = EnumValues({"Jawa Timur": Provinsi.JAWA_TIMUR});

// enum Sex { BETINA, JANTAN }

// final sexValues = EnumValues({"betina": Sex.BETINA, "jantan": Sex.JANTAN});

// enum Spesies { SAPI_LIMOSIN, SAPI_SIMENTAL }

// final spesiesValues = EnumValues({
//   "sapi limosin": Spesies.SAPI_LIMOSIN,
//   "sapi simental": Spesies.SAPI_SIMENTAL
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
