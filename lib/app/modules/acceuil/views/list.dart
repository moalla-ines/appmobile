import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';

class ListViewPage extends GetView<AcceuilController> {

  ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            child : Text('event 0')
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
              child : Text('event 1')
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
              child : Text('event 2')
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
              child : Text('event 3')
          ),
        ],

      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade800,
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
