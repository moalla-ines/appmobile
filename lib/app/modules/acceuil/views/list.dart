import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';

class ListViewPage extends GetView<AcceuilController> {
  ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('List',style: TextStyle(color:Colors.white,),),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          _buildExpansionTile(context, "event 0", Colors.blue.shade800),
          _buildExpansionTile(context, "event 1", Colors.blue.shade700),
          _buildExpansionTile(context, "event 2", Colors.blue.shade600),
          _buildExpansionTile(context, "event 3", Colors.blue.shade500),
          _buildExpansionTile(context, "event 4", Colors.blue.shade400),
          _buildExpansionTile(context, "event 5", Colors.blue.shade300),
          _buildExpansionTile(context, "event 6", Colors.blue.shade200),
        ],
      ),
      bottomNavigationBar: Obx(() => GNav(
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
      )),
    );
  }
}

  Widget _buildExpansionTile(BuildContext context, String title, Color color) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.black,fontWeight: FontWeight.w500),
      ),
      backgroundColor: color,
      children: [
        ListTile(
          title: Text("choisir niveau 1", style: TextStyle(color:Colors.white,),),
        ),
        ListTile(
          title: Text("choisir niveau 2", style: TextStyle(color:Colors.white,),),
        ),
        ListTile(
          title: Text("choisir niveau 3", style: TextStyle(color:Colors.white,),),
        ),
      ],
    );
  }

