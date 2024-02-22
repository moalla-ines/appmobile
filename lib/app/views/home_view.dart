import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t/app/controllers/home_controller.dart';
import 'package:t/app/views/acceuil_view.dart';
import 'package:t/app/views/inscription_view.dart';
class HomeView extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,

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
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "User Name",
                    hintText: "Enter votre nom ",
                  ),
                  controller: _controller.usernameController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _controller.passwordController,
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
                  onPressed: _controller.getImageFromGallery,
                  child: Text('Sélectionner une image'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _controller.getImageFromCamera,
                  child: Text('Ouvrir votre appareil photo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.usernameController.text.isNotEmpty && _controller.passwordController.text.isNotEmpty) {

                      _controller.onSubmitRegistrationForm(
                        _controller.usernameController.text,
                        _controller.passwordController.text,
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
                    Get.to(InscriptionView());
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
