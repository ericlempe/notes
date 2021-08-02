import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      Navigator.pushReplacementNamed(context, '/error');
    }
  }

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
