import 'package:get/get.dart';
import 'package:t/app/views/acceuil_view.dart';
import 'package:t/app/views/inscription_view.dart';
import '../views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomeView()),
    //GetPage(name: Routes.ACCEUIL, page: () => AcceuilView()),
    //GetPage(name: Routes.INSCRIPTION, page: () => InscriptionView()),
  ];

  static const INITIAL = Routes.HOME;
}
