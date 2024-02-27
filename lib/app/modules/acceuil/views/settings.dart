import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get.dart';
import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';

class SettingsView extends GetView<AcceuilController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),

        ),
      ),
    );

  }
  }