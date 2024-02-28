import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SettingsView extends GetView<AcceuilController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 22),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: ListTile(
                onTap: () {

                },
                title: Text(
                  "Account",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                trailing: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.lock_clock_outlined,color :Colors.blue),
                 title: Text("Change Password"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language,color :Colors.blue),
                    title: Text("Change Language"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.location_pin,color :Colors.blue),
                    title: Text("Change Location "),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){

                    },
                  ),
                ],
              ),
            )
          ],
        ),
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