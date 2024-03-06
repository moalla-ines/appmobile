import 'package:get/get.dart';

import '../modules/acceuil/bindings/acceuil_binding.dart';
import '../modules/acceuil/views/acceuil_view.dart';
import '../modules/acceuil/views/list.dart';
import '../modules/acceuil/views/settings.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inscription/bindings/inscription_binding.dart';
import '../modules/inscription/views/inscription_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ACCEUIL,
      page: () => AcceuilView(),
      binding: AcceuilBinding(),
    ),
    GetPage(
      name: _Paths.ACCEUIL,
      page: () => ListViewPage(),
    ),
    GetPage(
      name: _Paths.ACCEUIL,
      page: () => SettingsView(),
    ),
    GetPage(
      name: _Paths.INSCRIPTION,
      page: () => const InscriptionView(),
      binding: InscriptionBinding(),
    ),
  ];

  static const INITIAL = Routes.ACCEUIL;
}
