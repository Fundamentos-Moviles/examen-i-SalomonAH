import 'package:flutter/material.dart';
import 'package:examen1_ahas/notification.dart';
import 'package:examen1_ahas/utils/constant.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
