import 'dart:io';

import 'package:clean_login_api/infrastructure/navigation/routes.dart';
import 'package:clean_login_api/presentation/components/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../coolors.dart';
import 'controllers/welcome.controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            height: 180,
            "assets/images/main_top.png",
          ),
        ),
        Container(
          child: Text("Welcome to My Apps...",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/welcome.svg",
            height: 230,
            width: 230,
          ),
        ),
        SizedBox(
          height: 75,
        ),
        Container(
            child: button(
                text: "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
                buttonstyle: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Coolors.purplish,
                  textStyle: TextStyle(color: Colors.white),
                )).wh(context.screenWidth, 48).p16()),
        Container(
            child: button(
                text: "REGISTER",
                style: TextStyle(fontWeight: FontWeight.bold),
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
                buttonstyle: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Coolors.purplish,
                  textStyle: TextStyle(color: Colors.white),
                )).wh(context.screenWidth, 48).p16()),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              SystemNavigator.pop();
            },
            child: Text(
              "Skip",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    )));
  }
}
