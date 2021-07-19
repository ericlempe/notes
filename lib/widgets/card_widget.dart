import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  CardWidget({required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text("$title"), onTap: onClick),
    );
  }
}
