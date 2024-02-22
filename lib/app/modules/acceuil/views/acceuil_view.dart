import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/acceuil_controller.dart';

class AcceuilView extends GetView<AcceuilController> {
  const AcceuilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AcceuilView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AcceuilView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
