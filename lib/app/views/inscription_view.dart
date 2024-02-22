//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:t/app/views/home_view.dart';
//
// import '../controllers/home_controller.dart';
// import 'acceuil_view.dart';
//
// class InscriptionView extends StatelessWidget {
//   final HomeController _controller = Get.put(HomeController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmPasswordController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//       ),
//       drawer: Drawer(),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "Inscription",
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "User Name",
//                     hintText: "Enter votre nom ",
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Veuillez entrer un nom d\'utilisateur';
//                     }
//                     return null;
//                   },
//                 ),
//
//             SizedBox(height:10),
//             TextFormField(
//               controller: _passwordController,
//               keyboardType: TextInputType.text,
//               obscureText: true,
//
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Password",
//                 hintText: "Enter votre mot de passe ",
//               ),// Autres champs de formulaire (mot de passe, e-mail, etc.)
//     if (value == null || value.isEmpty) {
//     return 'Veuillez entrer un mot de passe';
//     }else if (value.length < 8) {
//     return 'Le mot de passe doit contenir au moins 8 caractères';
//     }
//     return null;
//
//   },
//   ),
//   SizedBox(height: 10),
//   TextFormField(
//   controller: _confirmPasswordController,
//   keyboardType: TextInputType.text,
//   obscureText: true,
//   decoration: InputDecoration(
//   border: OutlineInputBorder(),
//   labelText: "confirm Password",
//   hintText: "confirmer votre mot de passe ",
//   ),
//   validator: (value) {
//   if (value == null || value.isEmpty) {
//   return 'Veuillez confirmer mot de passe';
//   }else if (value != _passwordController.text) {
//   return 'Les mots de passe ne correspondent pas';
//   }
//   return null;
//   },
//   ),
//   SizedBox(height: 10),
//   TextFormField(
//
//   decoration: InputDecoration(
//   border: OutlineInputBorder(),
//   labelText: "email",
//   hintText: "Entrer votre Email ",
//   ),
//   validator: (value) {
//   if (value == null || value.isEmpty) {
//   return 'Veuillez entrer un Email';
//   }else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//   return 'Veuillez entrer un email valide';
//   }
//   return null;
//
//   },
//   ),
//   SizedBox(height:10),
//   ElevatedButton(
//   onPressed: () {
//   if (_formKey.currentState!.validate()) {
//
//   ScaffoldMessenger.of(context).showSnackBar(
//   const SnackBar(content: Text('Processing Data')),
//   );
//   }
//   },
//   style: ButtonStyle(
//   backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
//   ),
//   child: const Text('envoyer'),
//   ),
//   SizedBox(height:10),
//   GestureDetector(
//   onTap: () {
//   Get.to(Home());
//   },
//   child: Text(
//   'vous avez un compte deja ?',
//   style: TextStyle(
//   color: Colors.blue,
//   decoration: TextDecoration.underline,
//   ),
//   ),
//   ),
//   ],
//   ),
//   ),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _controller.onSubmitRegistrationForm(
//                         _usernameController.text,
//                         _passwordController.text,
//                         _emailController.text,
//                       );
//                     }
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
//                   ),
//                   child: const Text('Envoyer'),
//                 ),
//                 // Autres éléments d'interface utilisateur
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
