import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:t/app/model/model_user.dart';
import 'package:t/app/model/services.dart';

import 'package:t/app/modules/acceuil/views/acceuil_view.dart';
import 'package:t/app/modules/acceuil/views/list.dart';
import 'package:t/app/modules/acceuil/views/settings.dart';
import 'package:http/http.dart' as http;
import '../../../model/Article.dart';

class AcceuilController extends GetxController {
  // Observables
  var user = User().obs;
  var selectedIndex = 0.obs;
List<Articles> articles =[]; //Déclare une liste vide d'articles. Cette liste sera utilisée pour stocker des instances de la classe Articles.
  int index = 0;
  var firstAuthor = RxString('');// RxString est une classe fournie par GetX => lorsque change =l'auteur le widget faire la mise a jour

  bool isLoading = true.obs.value; // Utilisation correcte pour récupérer la valeur booléenne de l'observable isLoading
  bool receivedOfferNotification = true;
  void toggleReceivedOfferNotification(bool value) {
    receivedOfferNotification = value;
    update();
  }
  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 1;
    checkConnectivityOnInit();
    fetchAuthorAtIndex(index);
  }
  void checkConnectivityOnInit() {
    Connectivity().checkConnectivity().then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        // Aucune connexion, afficher le cercle de chargement
        isLoading = true;
        update();
      } else {
        // Connexion disponible, charger les données
        fetchAuthorAtIndex(index);
      }
    });
  }

  void fetchAuthorAtIndex(int index) {
    //pour récupérer et afficher l'auteur du premier article (à l'index initial, qui est normalement 0).
    isLoading = true; // Début du chargement
    ArticleServices.getAuthorAtIndex(index).then((value) {
      firstAuthor.value =
          value; // Utilisez la méthode value pour affecter la valeur
      print(firstAuthor.value);
      update();
      isLoading = false;
    }).catchError((error) {
      isLoading = false;
      log('Error fetching articles: $error');

    });

  }
  void changeAuthor() { // Cette méthode incrémente l'index actuel (index)
    index++; // Incrémente l'index
    fetchAuthorAtIndex(index); // pour mettre à jour l'auteur affiché.
  }
  // Navigation
  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.off(() => SettingsView());
        break;
      case 1:
        Get.off(() => AcceuilView());
        break;
      case 2:
        Get.off(() => ListViewPage());
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


}//En résumé, ces méthodes permettent de récupérer et
// d'afficher les auteurs des articles à partir d'un service d'API,
// en utilisant GetX pour gérer les mises à jour réactives de l'interface utilisateur.







