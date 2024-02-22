import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/registrations.dart';

import '../modules/model_user.dart';

class AcceuilView extends StatelessWidget {
  final User user;

  AcceuilView({Key? key, required this.user, required RegistrationData registrationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username: ${user.username}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Password: ${user.password}',
              style: TextStyle(fontSize: 20),
            ),
            if (user.imagePath != null)
              Image.file(
                File(user.imagePath!),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
