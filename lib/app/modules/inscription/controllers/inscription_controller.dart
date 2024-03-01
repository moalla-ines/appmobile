import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/views/acceuil_view.dart';

class InscriptionController extends GetxController {


  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onClose() {
  usernameController.dispose();
  passwordController.dispose();
  confirmPasswordController.dispose();
  emailController.dispose();
  super.onClose();
  }

  void onSubmitRegistrationForm() {
  if (formKey.currentState!.validate()) {
  // Logique de soumission du formulaire
  Get.snackbar('Succès', 'Formulaire envoyé avec succès');
  Get.to(AcceuilView());
  }
  }
  }
