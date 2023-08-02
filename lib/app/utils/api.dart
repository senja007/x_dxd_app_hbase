import 'package:get_storage/get_storage.dart';

class SharedApi {
  String imageUrl = "http://192.168.2.84:8080/";
  String baseUrl = "http://192.168.2.84:8080/api";

  Map<String, String> getToken() {
    final box = GetStorage();
    String? token = box.read("token");
    if (token != null)
      return {
        "Authorization": "Bearer" + token,
      };

    return {
      "Authorization": "Bearer" + "BadToken",
    };
  }
}
