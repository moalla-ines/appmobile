import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/model/model_user.dart';

import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';

class AcceuilView extends GetView<AcceuilController> {
  AcceuilView({Key? key}) : super(key: key);
  @override

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
            Obx(() {
              return Text(
                'Username: ${controller.user.value.username}',
                style: TextStyle(fontSize: 20),
              );
            }),
            Obx(() {
              return Text(
                'Password: ${controller.user.value.password}',
                style: TextStyle(fontSize: 20),
              );
            }),
            Obx(() {
              if (controller.user.value.imagePath != null) {
                return Image.file(
                  File(controller.user.value.imagePath!),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
