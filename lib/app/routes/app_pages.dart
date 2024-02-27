import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/views/list.dart';
import 'package:t/app/modules/acceuil/views/settings.dart';

import '../modules/acceuil/bindings/acceuil_binding.dart';
import '../modules/acceuil/views/acceuil_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';

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
      name: _Paths.TEST,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
  ];

  static const INITIAL = Routes.ACCEUIL;
}
