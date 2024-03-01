import 'dart:convert';

import 'package:get/get.dart';
import 'package:t/app/model/model_user.dart';
import 'package:t/app/model/setting_model.dart';
import 'package:t/app/modules/acceuil/views/acceuil_view.dart';
import 'package:t/app/modules/acceuil/views/list.dart';
import 'package:t/app/modules/acceuil/views/settings.dart';
import 'package:http/http.dart' as http;
import '../../../model/Article.dart';

class AcceuilController extends GetxController {
  // Observables
  var user = User().obs;
  var selectedIndex = 0.obs;
List<Articles> articles =[];

  bool receivedOfferNotification = true;

  void toggleReceivedOfferNotification(bool value) {
    receivedOfferNotification = value;
    update();
  }
  @override
  void onInit() {
    super.onInit();
    articles =getAllArticles() as List<Articles>;
    // Fetch requests when the controller is initialized
  }

  // Navigation
  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.to(() => SettingsView());
        break;
      case 1:
        Get.to(() => AcceuilView());
        break;
      case 2:
        Get.to(() => ListViewPage());
        break;
    }
  }

  // Met à jour les informations de l'utilisateur
  void updateUser(String username, String password, String imagePath) {
    user.update((val) {
      val!.username = username;
      val.password = password;
      val.imagePath = imagePath;
    });
  }
  static Future<List<Articles>> getAllArticles() async {
    final url = Uri.parse(' https://newsapi.org/v2/everything?q=apple&from=2024-02-19&to=2024-02-19&sortBy=popularity&apiKey=d1524278d8154a8d862be41a94ae2513 ');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Articles> articles = [];
      for (var item in jsonData) {
        articles.add(Articles.fromJson(item));
      }
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }


}
