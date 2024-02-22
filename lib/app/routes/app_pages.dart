import 'package:get/get.dart';

import '../modules/acceuil/bindings/acceuil_binding.dart';
import '../modules/acceuil/views/acceuil_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

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
      page: () =>   AcceuilView(),
      binding: AcceuilBinding(),
    ),
  ];

  static const INITIAL = Routes.HOME;
}
