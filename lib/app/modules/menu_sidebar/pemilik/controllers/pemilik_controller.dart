import 'package:get/get.dart';

class PemilikController extends GetxController {
  var items = <String>[].obs;
  void addItem(String item) {
    items.add(item);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}
