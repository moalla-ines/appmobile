import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:t/app/modules/home/views/home_view.dart';

class SettingsView extends GetView<AcceuilController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 22 , color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children:<Widget>[
          SingleChildScrollView(
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
                      style: TextStyle(fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                            Icons.lock_clock_outlined, color: Colors.blue),
                        title: Text("Change Password"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {

                        },
                      ),

                      _buildDivider(),
                      ListTile(
                        leading: Icon(Icons.language, color: Colors.blue),
                        title: Text("Change Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Choisir la langue"),
                                content: Column(

                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Francais"),
                                    Text("Anglais"),
                                    Text("Arabe"),
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
                      ),

                      _buildDivider(),
                      ListTile(
                        leading: Icon(Icons.location_pin, color: Colors.blue),
                        title: Text("Change Location "),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.blue,
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      "Notification Settings",
                      style: TextStyle(fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SwitchListTile(

                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(5),
                    value: true,
                    title: Text("Recieved Notification"),
                  onChanged: (val){},),
                SwitchListTile(
                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(5),
                  value: true,
                  title: Text("Recieved offer Notification"),
                  onChanged: (val){},),
                SwitchListTile(
                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(5),
                  value: false,
                  title: Text("Recieved Newsletter"),
                  onChanged: (val){},),
                SwitchListTile(
                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(5),
                  value: false,
                  title: Text("Recieved App Updates"),
                  onChanged: (val){},),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            right: -20,
            child: Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.power_settings_new_outlined, color: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.grey.shade50,
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

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade200,
    );
  }
}



















