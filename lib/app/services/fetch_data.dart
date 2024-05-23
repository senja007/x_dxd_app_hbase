import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/kandang_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/kandang_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FetchData {
  RxString selectedPeternakId = ''.obs;
  RxList<PeternakModel> peternakList = <PeternakModel>[].obs;

  RxString selectedPetugasId = ''.obs;
  RxList<PetugasModel> petugasList = <PetugasModel>[].obs;

  RxString selectedKandangId = ''.obs;
  RxList<KandangModel> kandangList = <KandangModel>[].obs;

  RxString selectedHewanEartag = ''.obs;
  RxList<HewanModel> hewanList = <HewanModel>[].obs;

//get data peternak
  Future<List<PeternakModel>> fetchPeternaks() async {
    try {
      final PeternakListModel peternakListModel =
          await PeternakApi().loadPeternakApi();
      final List<PeternakModel> peternaks = peternakListModel.content ?? [];
      if (peternaks.isNotEmpty) {
        selectedPeternakId.value = peternaks.first.idPeternak ?? '';
      }
      peternakList.assignAll(peternaks);
      return peternaks;
    } catch (e) {
      print('Error fetching peternaks: $e');
      showErrorMessage("Error fetching peternaks: $e");
      return [];
    }
  }

//get data petugas
  Future<List<PetugasModel>> fetchPetugas() async {
    try {
      final PetugasListModel petugasListModel =
          await PetugasApi().loadPetugasApi();
      final List<PetugasModel> petugass = petugasListModel.content ?? [];
      if (petugass.isNotEmpty) {
        selectedPetugasId.value = petugass.first.nikPetugas ?? '';
      }
      petugasList.assignAll(petugass);
      return petugass;
    } catch (e) {
      print('Error fetching Petugas: $e');
      showErrorMessage("Error fetching Petugas: $e");
      return [];
    }
  }

  //get data kandang
  Future<List<KandangModel>> fetchKandangs() async {
    try {
      final KandangListModel kandangListModel =
          await KandangApi().loadKandangApi();
      final List<KandangModel> kandangs = kandangListModel.content ?? [];
      if (kandangs.isNotEmpty) {
        selectedKandangId.value = kandangs.first.idKandang ?? '';
      }
      kandangList.assignAll(kandangs);
      return kandangs;
    } catch (e) {
      print('Error fetching peternaks: $e');
      showErrorMessage("Error fetching peternaks: $e");
      return [];
    }
  }

  Future<List<HewanModel>> fetchHewan() async {
    try {
      final HewanListModel hewanListModel = await HewanApi().loadHewanApi();
      final List<HewanModel> hewan = hewanListModel.content ?? [];
      if (hewan.isNotEmpty) {
        selectedHewanEartag.value = hewan.first.kodeEartagNasional ?? '';
      }
      hewanList.assignAll(hewan);
      return hewan;
    } catch (e) {
      print('Error fetching hewan: $e');
      showErrorMessage("Error fetching hewan: $e");
      return [];
    }
  }
}
