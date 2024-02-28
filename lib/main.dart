import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';

import 'package:t/app/routes/app_pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override

  Widget build(BuildContext context) {
    Get.put(AcceuilController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}