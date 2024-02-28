import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SettingsView extends GetView<AcceuilController> {
 SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom -
              kToolbarHeight -
              kBottomNavigationBarHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Account",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 20, thickness: 1),
                  SizedBox(height: 20),
                  buildAccountOption(context, "Change Password"),
                  buildAccountOption(context, "Content Settings"),
                  buildAccountOption(context, "Social"),
                  buildAccountOption(context, "Language"),
                  buildAccountOption(context, "Privacy and Security "),
                  SizedBox(height: 40), // Ajout d'un espace entre les sections
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Icon(Icons.volume_up_outlined, color: Colors.blue),
                        SizedBox(width: 10),
                        Text("Notifications",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Divider(height: 20, thickness: 1),
                  SizedBox(height: 20),
                  buildNotificationOption(
                      "theme Dark", controller.valNotify1.value, controller.onChangeFunction1),
                  buildNotificationOption(
                      "Notification 2", controller.valNotify2.value, controller.onChangeFunction2),
                  buildNotificationOption(
                      "Notification 3", controller.valNotify3.value, controller.onChangeFunction3),
                ],
              ),
            ),
          ),
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

 Padding buildNotificationOption(String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: Switch(
              activeColor: Colors.blue,
              value: value,
              onChanged: (bool? newValue) {
                if (newValue != null) {
                  onChangeMethod(newValue);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
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
                  Text("Modifier le mot de passe"),
                  Text("Gérer les notifications"),
                  Text("Déconnexion"),
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
    );
  }
}
