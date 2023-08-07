import 'package:get/get.dart';

import 'package:crud_flutter_api/app/modules/buku_lahir/bindings/buku_lahir_binding.dart';
import 'package:crud_flutter_api/app/modules/buku_lahir/views/buku_lahir_view.dart';
import 'package:crud_flutter_api/app/modules/kandang/bindings/kandang_binding.dart';
import 'package:crud_flutter_api/app/modules/kandang/views/kandang_view.dart';
import 'package:crud_flutter_api/app/modules/kartu_ternak/bindings/kartu_ternak_binding.dart';
import 'package:crud_flutter_api/app/modules/kartu_ternak/views/kartu_ternak_view.dart';
import 'package:crud_flutter_api/app/modules/main/bindings/main_binding.dart';
import 'package:crud_flutter_api/app/modules/main/views/main_view.dart';
import 'package:crud_flutter_api/app/modules/mutasi/bindings/mutasi_binding.dart';
import 'package:crud_flutter_api/app/modules/mutasi/views/mutasi_view.dart';
import 'package:crud_flutter_api/app/modules/navigation/bindings/navigation_binding.dart';
import 'package:crud_flutter_api/app/modules/navigation/views/navigation_view.dart';
import 'package:crud_flutter_api/app/modules/pakan/bindings/pakan_binding.dart';
import 'package:crud_flutter_api/app/modules/pakan/views/pakan_view.dart';
import 'package:crud_flutter_api/app/modules/pemilik/bindings/pemilik_binding.dart';
import 'package:crud_flutter_api/app/modules/pemilik/views/pemilik_view.dart';
import 'package:crud_flutter_api/app/modules/produksi/bindings/produksi_binding.dart';
import 'package:crud_flutter_api/app/modules/produksi/views/produksi_view.dart';
import 'package:crud_flutter_api/app/modules/sidebar/bindings/sidebar_binding.dart';
import 'package:crud_flutter_api/app/modules/sidebar/views/sidebar_view.dart';
import 'package:crud_flutter_api/app/modules/unit_usaha/bindings/unit_usaha_binding.dart';
import 'package:crud_flutter_api/app/modules/unit_usaha/views/unit_usaha_view.dart';
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
      page: () => const StartView(),
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
    // GetPage(
    //   name: _Paths.SIDEBAR,
    //   page: () => SidebarView(),
    //   binding: SidebarBinding(),
    // ),
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
      name: _Paths.UNIT_USAHA,
      page: () => UnitUsahaView(),
      binding: UnitUsahaBinding(),
    ),
    GetPage(
      name: _Paths.KANDANG,
      page: () => KandangView(),
      binding: KandangBinding(),
    ),
    GetPage(
      name: _Paths.PAKAN,
      page: () => PakanView(),
      binding: PakanBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_LAHIR,
      page: () => BukuLahirView(),
      binding: BukuLahirBinding(),
    ),
    GetPage(
      name: _Paths.PEMILIK,
      page: () => PemilikView(),
      binding: PemilikBinding(),
    ),
    GetPage(
      name: _Paths.KARTU_TERNAK,
      page: () => KartuTernakView(),
      binding: KartuTernakBinding(),
    ),
    GetPage(
      name: _Paths.MUTASI,
      page: () => MutasiView(),
      binding: MutasiBinding(),
    ),
    GetPage(
      name: _Paths.PRODUKSI,
      page: () => ProduksiView(),
      binding: ProduksiBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
