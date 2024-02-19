import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t/app/modules/home/controllers/home_controller.dart';
import 'package:t/app/modules/home/views/acceuil_view.dart';
import 'package:t/app/modules/home/views/inscription_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController _controller = HomeController();
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _imagePath;

  Future<String?> getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
      return pickedFile.path;
    } else {
      return null;
    }
  }

  Future<String?> getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
      return pickedFile.path;
    } else {
      return null;
    }
  }


  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
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
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom d\'utilisateur';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
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
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _imagePath != null
                    ? Image.file(
                  File(_imagePath!),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
                    : SizedBox(), // Affiche une boîte vide si aucune image n'est sélectionnée
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: getImageFromGallery,
                  child: Text('Sélectionner une image'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: getImageFromCamera,
                  child: Text('Ouvrir votre appareil photo'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String? imagePath = await getImageFromGallery();
                      imagePath ??= await getImageFromCamera();
                      if (imagePath != null) {
                        Get.to(
                              () => AcceuilView(),
                          arguments: {
                            'username': usernameController.text,
                            'password': passwordController.text,
                            'imagePath': _imagePath,
                          },
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Bienvenue',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                              ),
                            ),
                            backgroundColor: Colors.lightGreen,
                          ),
                        );
                      }
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
