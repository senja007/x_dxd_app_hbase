import 'package:get_storage/get_storage.dart';

class SharedApi {
  // String imageUrl = "http://192.168.5.245:8080/";
  // String baseUrl = "http://192.168.5.245:8080/api";

  String imageUrl = "http://23.150.24.250:50185/downloadFile/";
  String baseUrl = "http://23.150.24.250:50185/api";
  
//https://192.168.0.230:8443/api
  Map<String, String> getToken() {
    final box = GetStorage();
    String? token = box.read("token");
    if (token != null)
      return {
        "Authorization": "Bearer " + token,
      };

    return {
      "Authorization": "Bearer " + "BadToken",
    };
  }
}
