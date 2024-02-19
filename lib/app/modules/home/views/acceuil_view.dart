import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceuilView extends StatelessWidget {
  const AcceuilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    String username = args['username'];
    String password = args['password'];
    String? imagePath = args['imagePath'];

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
              'Username: $username',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Password: $password',
              style: TextStyle(fontSize: 20),
            ),
            if (imagePath != null)
              Image.file(
                File(imagePath),
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
