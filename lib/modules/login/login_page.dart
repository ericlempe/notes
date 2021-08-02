import 'package:flutter/material.dart';

import 'login_controller.dart';
import 'login_state.dart';
import 'login_service.dart';
import 'widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
        service: LoginServiceImpl(),
        onUpdate: () {
          if (controller.state is LoginStateSuccess) {
            final user = (controller.state as LoginStateSuccess).user;
            Navigator.pushReplacementNamed(context, '/home', arguments: user);
          } else {
            setState(() {});
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Container(
                  width: 236,
                  child: Text(
                    'Crie notas para o seu dia a dia',
                    style: TextStyle(fontSize: 35,
                        fontWeight: FontWeight.w400,
                        color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 32,
              ),
              if (controller.state is LoginStateLoading) ...[
                CircularProgressIndicator(),
              ] else
                if (controller.state is LoginStateFailure) ...[
                  Text((controller.state as LoginStateFailure).message)
                ] else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: SocialButtonWidget(
                      imagePath: 'assets/images/google.png',
                      label: 'Entrar com Google',
                      onTap: () => controller.googleSignIn(),
                    ),
                  ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
