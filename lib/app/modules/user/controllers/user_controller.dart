import 'package:crud_flutter_api/app/data/user_model.dart';
import 'package:crud_flutter_api/app/services/auth_api.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  UserModel? users;
  final box = GetStorage();
  bool homeScreen = false;
}
