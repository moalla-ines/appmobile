import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../model/Article.dart';
import '../controllers/acceuil_controller.dart';

class AcceuilView extends GetView<AcceuilController> {
  AcceuilView({Key? key}) : super(key: key);

  var firstAuthor = ''.obs;

  // Liste d'images
  final List<String> images = [
    "assets/images/Angular.png",
    "assets/images/C++.png",
    "assets/images/Laravel.png",
    "assets/images/flutter.png",
    "assets/images/java.png",
    "assets/images/js.png",
    "assets/images/Python-logo.png",
    "assets/images/react.png",
    // Ajoutez ici les chemins vers les autres images
  ];

  // Liste des noms de langage
  final List<String> languages = [
    "Angular",
    "C++",
    "Laravel",
    "Flutter",
    "Java",
    "JavaScript",
    "Python",
    "React",
    // Ajoutez ici les noms des autres langages
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _buildGridView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.75,
      ),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildGridTile(index);
      },
    );
  }

  Widget _buildGridTile(int index) {
    return GridTile(
      child: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                languages[index], // Utiliser le nom de langage correspondant à l'index
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Image.asset(
                images[index], // Utiliser l'image correspondant à l'index
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => GNav(
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
    ));
  }
}

