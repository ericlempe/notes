import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  ButtonWidget({required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: ElevatedButton(onPressed: onClick, child: Text("$title")),
        ),
      ],
    );
  }
}
