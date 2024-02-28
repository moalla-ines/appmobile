import 'package:get/get.dart';
import 'package:t/app/model/model_user.dart';
import 'package:t/app/model/setting_model.dart';
import 'package:t/app/modules/acceuil/views/acceuil_view.dart';
import 'package:t/app/modules/acceuil/views/list.dart';
import 'package:t/app/modules/acceuil/views/settings.dart';

class AcceuilController extends GetxController {
  // Observables
  var user = User().obs;
  var selectedIndex = 0.obs;


  bool receivedOfferNotification = true;

  void toggleReceivedOfferNotification(bool value) {
    receivedOfferNotification = value;
    update();
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

  // Met à jour les informations de l'utilisateur
  void updateUser(String username, String password, String imagePath) {
    user.update((val) {
      val!.username = username;
      val.password = password;
      val.imagePath = imagePath;
    });
  }
}
