import 'package:flutter/material.dart';
class  MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
children: [
  // 1st menu option
Container(
  height: 50,color: Colors.deepPurpleAccent.shade400,
),
  // 2end menu option
  Container(
    height: 50,color: Colors.deepPurpleAccent.shade200,
  ),
  // 3rd menu option
  Container(
    height: 50,color: Colors.deepPurpleAccent.shade100,
  ),
],
    );
  }
}