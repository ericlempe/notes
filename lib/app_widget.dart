import 'package:flutter/material.dart';
import 'package:notes/modules/splash/splash_page.dart';

import 'modules/create_note/create_note_page.dart';
import 'modules/error/error_page.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        "/": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotepage(),
        "/error": (context) => ErrorPage(),
      }
    );
  }
}
