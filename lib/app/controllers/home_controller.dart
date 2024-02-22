import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../modules/registrations.dart';
import '../views/acceuil_view.dart';

class HomeController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  String? _imagePath;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _imagePath = pickedFile.path;
    }
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _imagePath = pickedFile.path;
    }
  }

  void onSubmit() {
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // Vous pouvez traiter les données ici ou les passer à un autre composant
      Get.to(() => AcceuilView(user: user, registrationData: registrationData ,));
    } else {
      Get.snackbar('Erreur', 'Veuillez remplir tous les champs.');
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

void onSubmitRegistrationForm(String username, String password, String email) {
  RegistrationData registrationData = RegistrationData(
    username: username,
    password: password,
    email: email,
  );
  // Effectuer des actions avec les données d'inscription, par exemple :
  // - Enregistrer les données dans une base de données
  // - Envoyer les données à un serveur
  // - Naviguer vers une autre vue
  Get.to(AcceuilView(registrationData: registrationData, user: User,));
}
}