import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';

class ListViewPage extends GetView<AcceuilController> {
  ListViewPage({Key? key}) : super(key: key);

  @override
  _buildEvent(BuildContext context, String title, Color color) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("choisir niveau 1"),
                  Text("choisir niveau 2"),
                  Text("choisir niveau 3"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Fermer"),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 100,
        height: 100,
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('List'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          _buildEvent(context, "event 0", Colors.blue.shade800),
          _buildEvent(context, "event 1", Colors.blue.shade700),
          _buildEvent(context, "event 2", Colors.blue.shade600),
          _buildEvent(context, "event 3", Colors.blue.shade500),
          _buildEvent(context, "event 4", Colors.blue.shade400),
          _buildEvent(context, "event 5", Colors.blue.shade300),
          _buildEvent(context, "event 6", Colors.blue.shade200),
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