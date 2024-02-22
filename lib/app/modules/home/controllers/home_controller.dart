import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t/app/model/model_user.dart';
import 'package:t/app/model/registrations.dart';
import 'package:t/app/modules/acceuil/views/acceuil_view.dart';
import 'package:t/app/views/acceuil_view.dart';


class HomeController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  String? imagePath;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }





  Future<void> getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
    }
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
    }
  }
  void onSubmitRegistrationForm(String username, String password, String email) {
    if (username.isNotEmpty && password.isNotEmpty && email.isNotEmpty) {
      // Créer une instance de User avec les données du formulaire
      User user = User(username: username, password: password);

      // Créer une instance de RegistrationData avec les données du formulaire
      RegistrationData registrationData = RegistrationData(
        username: username,
        password: password,
        email: email,
      );

      // Passer les données à la vue AcceuilView
      Get.to(() => AcceuilView());
      //user: user, registrationData: registrationData
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



}
