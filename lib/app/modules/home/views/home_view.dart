
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:t/app/modules/home/controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,

      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "User Name",
                    hintText: "Enter votre nom ",
                  ),
                  controller: controller.usernameController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Enter votre mot de passe ",
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.getImageFromGallery,
                  child: Text('Sélectionner une image'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.getImageFromCamera,
                  child: Text('Ouvrir votre appareil photo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.usernameController.text.isNotEmpty && controller.passwordController.text.isNotEmpty) {

                      controller.onSubmitRegistrationForm(
                        controller.usernameController.text,
                        controller.passwordController.text,
                        'email@example.com',
                      );
                    } else {
                      Get.snackbar('Erreur', 'Veuillez remplir tous les champs.');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: const Text('envoyer'),
                ),

                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Get.to(InscriptionView());
                  },
                  child: Text(
                    'New User? Create Account',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
