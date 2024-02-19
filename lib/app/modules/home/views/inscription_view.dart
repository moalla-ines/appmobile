

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/home/views/home_view.dart';

import 'acceuil_view.dart';

class InscriptionView extends StatefulWidget {
  const InscriptionView({Key? key}) : super(key: key);

  @override
  _InscriptionViewState createState() => _InscriptionViewState();
}

class _InscriptionViewState extends State<InscriptionView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

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
                  "inscription",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
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
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
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
                SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "confirm Password",
                    hintText: "confirmer votre mot de passe ",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez confirmer mot de passe';
                    } else if (value != _passwordController.text) {
                      return 'Les mots de passe ne correspondent pas';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "email",
                    hintText: "Entrer votre Email ",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un Email';
                    } else
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(
                        value)) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(AcceuilView());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.grey),
                  ),
                  child: const Text('envoyer'),

                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Get.to(HomeView());
                  },
                  child: Text(
                    'vous avez un compte deja ?',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: Text('Retour'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}