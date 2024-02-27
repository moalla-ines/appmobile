import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:t/app/modules/acceuil/controllers/acceuil_controller.dart';

class ListViewPage extends GetView<AcceuilController> {

  ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blue[900],
            child : Text('event 0')
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue[800],
              child : Text('event 1')
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue[700],
              child : Text('event 2')
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue[600],
              child : Text('event 3')
          ),
        ],
      ),
    );
  }
}
