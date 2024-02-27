import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/model/model_user.dart';
import 'package:t/app/model/setting_model.dart';
import 'package:t/app/modules/acceuil/views/acceuil_view.dart';
import 'package:t/app/modules/acceuil/views/settings.dart';

class AcceuilController extends GetxController {
  // Variables observables
  var user = User().obs;
  RxInt selectedIndex = 0.obs;
  var settings = SettingsModel(fingerprintEnabled: false).obs;

  void toggleFingerprint(bool value) {
    settings.update((val) {
      val!.fingerprintEnabled = value;
    });
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(() => SettingsView());
        break;
      case 1:
        Get.to(() => AcceuilView());
        break;
      case 2:
        Get.to(() => ListView());
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
