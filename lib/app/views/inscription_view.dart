

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/views/home_view.dart';

import '../controllers/home_controller.dart';
import 'acceuil_view.dart';

class InscriptionView extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Inscription",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
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
                // Autres champs de formulaire (mot de passe, e-mail, etc.)
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _controller.onSubmitRegistrationForm(
                        _usernameController.text,
                        _passwordController.text,
                        _emailController.text,
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: const Text('Envoyer'),
                ),
                // Autres éléments d'interface utilisateur
              ],
            ),
          ),
        ),
      ),
    );
  }
}
