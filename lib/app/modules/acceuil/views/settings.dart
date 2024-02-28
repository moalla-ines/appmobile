import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SettingsView extends GetView<AcceuilController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
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
                const SizedBox(height: 10.0),
                Text("Notification Settings",style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
            width: 80,
            height: 80,
alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child:IconButton(
            icon:Icon(Icons.power_settings_new_outlined,color: Colors.white),
              onPressed: () {  },
          ),
          ),
          )

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



















