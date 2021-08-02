import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  SocialButtonWidget({
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.fromBorderSide(BorderSide(color: Colors.black38)),
        ),
        child: Row(
          children: [
            Container(
              width: 57,
              height: 57,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset(imagePath),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 1,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Text(label),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
