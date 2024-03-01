import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:t/app/modules/home/views/home_view.dart';

import '../controllers/inscription_controller.dart';

class InscriptionView extends GetView<InscriptionController> {
  const InscriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
              "Inscription",
              style: TextStyle(
                fontSize: 40.0,fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height:5),
            TextFormField(
              controller: controller.usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "User Name",
                hintText: "Enter votre nom ",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un nom d\'utilisateur';
                }
                return null;
              },
            ),
            SizedBox(height: 5),

            TextFormField(

              controller: controller.passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Enter votre mot de passe ",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                } else if (value.length < 8) {
                  return 'Le mot de passe doit contenir au moins 8 caractères';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: controller.confirmPasswordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Confirm Password",
                hintText: "Confirmer votre mot de passe ",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez confirmer mot de passe';
                } else if (value != controller.passwordController.text) {
                  return 'Les mots de passe ne correspondent pas';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Entrer votre Email ",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un Email';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Veuillez entrer un email valide';
                }
                return null;
              },
            ),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: controller.onSubmitRegistrationForm,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: const Text('Envoyer'),
                ),

                GestureDetector(
          onTap: () {
            Get.to(HomeView());
          },
          child: Text(
            'Vous avez un compte déjà ?',
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
