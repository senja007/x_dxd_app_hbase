import 'package:get/get.dart';

import 'package:crud_flutter_api/app/modules/menu_sidebar/kelahiran/bindings/kelahiran_binding.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/kelahiran/views/kelahiran_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/hewan/bindings/hewan_binding.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/hewan/views/hewan_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/mutasi/bindings/inseminasi_binding.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/mutasi/views/inseminasi_view.dart';
import 'package:crud_flutter_api/app/modules/myaccount/bindings/myaccount_binding.dart';
import 'package:crud_flutter_api/app/modules/myaccount/views/myaccount_view.dart';
import 'package:crud_flutter_api/app/modules/navigation/bindings/navigation_binding.dart';
import 'package:crud_flutter_api/app/modules/navigation/views/navigation_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/pengobatan/bindings/pengobatan_binding.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/pengobatan/views/pengobatan_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/pemilik/bindings/pemilik_binding.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/pemilik/views/pemilik_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/petugas/bindings/petugas_binding.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/petugas/views/petugas_view.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/vaksin/bindings/vaksin_binding.dart';
import 'package:crud_flutter_api/app/modules/menu_sidebar/vaksin/views/vaksin_view.dart';
import 'package:crud_flutter_api/app/modules/user/bindings/user_binding.dart';
import 'package:crud_flutter_api/app/modules/user/views/user_view.dart';

import '../modules/add_post/bindings/add_post_binding.dart';
import '../modules/add_post/views/add_post_view.dart';
import '../modules/all_post/bindings/all_post_binding.dart';
import '../modules/all_post/views/all_post_view.dart';
import '../modules/detail_post/bindings/detail_post_binding.dart';
import '../modules/detail_post/views/detail_post_view.dart';
import '../modules/edit_post/bindings/edit_post_binding.dart';
import '../modules/edit_post/views/edit_post_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menu_sidebar/PKB/bindings/pkb_binding.dart';
import '../modules/menu_sidebar/PKB/views/pkb_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/start/bindings/start_binding.dart';
import '../modules/start/views/start_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ALL_POST,
      page: () => const AllPostView(),
      binding: AllPostBinding(),
    ),
    GetPage(
      name: _Paths.ADD_POST,
      page: () => const AddPostView(),
      binding: AddPostBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_POST,
      page: () => const DetailPostView(),
      binding: DetailPostBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_POST,
      page: () => const EditPostView(),
      binding: EditPostBinding(),
    ),
    GetPage(
      name: _Paths.PKB,
      page: () => PkbView(),
      binding: PkbBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.HEWAN,
      page: () => HewanView(),
      binding: HewanBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: _Paths.PENGOBATAN,
      page: () => PengobatanView(),
      binding: PengobatanBinding(),
    ),
    GetPage(
      name: _Paths.KELAHIRAN,
      page: () =>KelahiranView(),
      binding:KelahiranBinding(),
    ),
    GetPage(
      name: _Paths.PEMILIK,
      page: () => PemilikView(),
      binding: PemilikBinding(),
    ),
    GetPage(
      name: _Paths.INSEMINASI,
      page: () => InseminasiView(),
      binding: InseminasiBinding(),
    ),
    GetPage(
      name: _Paths.VAKSIN,
      page: () => VaksinView(),
      binding: VaksinBinding(),
    ),
    // GetPage(
    //   name: _Paths.MAIN,
    //   page: () => MainView(),
    //   binding: MainBinding(),
    // ),
    GetPage(
      name: _Paths.MYACCOUNT,
      page: () => MyaccountView(),
      binding: MyaccountBinding(),
    ),
    GetPage(
      name: _Paths.PETUGAS,
      page: () => PetugasView(),
      binding: PetugasBinding(),
      transition: Transition.native,
    ),
  ];
}
