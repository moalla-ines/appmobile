import 'package:get/get.dart';
import 'package:t/app/model/model_user.dart';
import 'package:t/app/model/setting_model.dart';
import 'package:t/app/modules/acceuil/views/acceuil_view.dart';
import 'package:t/app/modules/acceuil/views/list.dart';
import 'package:t/app/modules/acceuil/views/settings.dart';

class AcceuilController extends GetxController {
  var user = User().obs;
  var selectedIndex = 0.obs;
  var settings = SettingsModel().obs;
  var valNotify1 = true.obs;
  var valNotify2 = false.obs;
  var valNotify3 = false.obs;

  // Gestion des paramètres de réglage
  void toggleDarkTheme(bool value) {
    settings.update((val) {
      val!.darkTheme = value;
    });
  }

  void toggleNotifications(bool value) {
    settings.update((val) {
      val!.notificationsEnabled = value;
    });
  }


  void onChangeFunction1(bool newValue1) {
    valNotify1.value = newValue1;
  }

  void onChangeFunction2(bool newValue2) {
    valNotify2.value = newValue2;
  }

  void onChangeFunction3(bool newValue3) {
    valNotify3.value = newValue3;
  }

  // Navigation
  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.to(() => SettingsView());
        break;
      case 1:
        Get.to(() => AcceuilView());
        break;
      case 2:
        Get.to(() => ListViewPage());
        break;
    }
  }

  void updateUser(String username, String password, String imagePath) {
    user.update((val) {
      val!.username = username;
      val.password = password;
      val.imagePath = imagePath;
    });
  }
}
