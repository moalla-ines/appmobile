import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';

class AcceuilView extends GetView<AcceuilController> {
  AcceuilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'List',
          ),
        ],
      ),
    );
  }
}
