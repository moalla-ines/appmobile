import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';
import 'package:t/app/modules/home/views/home_view.dart';

class AcceuilView extends GetView<AcceuilController> {
  AcceuilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(110),
            margin: EdgeInsets.all(10),
            color: Colors.blue.shade100,
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
          Positioned(
            bottom: -20,
            right: -20,
            child: Container(
              width: 70,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.power_settings_new_outlined, color: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.grey,
                        title: Text("Voulez-vous vraiment  déconnecter ?"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Fermer"),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => HomeView());
                            },
                            child: Text("oui"),
                          ),
                          ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.blue,
        color: Colors.white,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.grey.shade50,
        padding: EdgeInsets.all(20),
        gap: 8,
        selectedIndex: controller.selectedIndex.value,
        onTabChange: controller.onItemTapped,
        tabs: [
          GButton(icon: Icons.settings, text: 'Settings'),
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.list, text: 'List'),
        ],
      ),
    );
  }
}
