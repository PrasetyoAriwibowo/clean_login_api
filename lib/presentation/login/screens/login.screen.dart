import 'package:clean_login_api/coolors.dart';
import 'package:clean_login_api/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Coolors.purplish,
              ),
              Container(
                width: context.screenWidth,
                height: context.percentHeight * 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    )),
                child: VStack([
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: context.screenWidth,
                    height: 160,
                    child: Image.asset("assets/images/login.png"),
                  ),
                  TextField(
                    controller: controller.usernameController,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Username",
                      contentPadding: Vx.m2,
                      hintText: "Input your username",
                      prefixIcon: Icon(
                        Icons.people,
                      ),
                    ),
                  ).p16(),
                  Container(
                      child: Obx(() => (TextField(
                            controller: controller.passwordController,
                            autofocus: true,
                            obscureText: controller.isHidePassword.value,
                            decoration: InputDecoration(
                                contentPadding: Vx.m2,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: "Input your password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: (() {
                                      controller.isHidePassword.value =
                                          !controller.isHidePassword.value;
                                    }),
                                    icon: controller.isHidePassword.value
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility))),
                          ).p16()))),
                  "Forgot password?"
                      .text
                      .sm
                      .caption(context)
                      .make()
                      .objectCenterRight()
                      .p16(),
                  ElevatedButton(
                      onPressed: () async {
                        await controller.login();
                      },
                      child: "Log In".text.bold.make(),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Coolors.purplish,
                        textStyle: TextStyle(color: Colors.white),
                      )).wh(context.screenWidth, 48).p16()
                ]),
              ),
              Positioned(
                child: VStack(
                  [
                    HStack(
                      [
                        SvgPicture.asset('assets/fb.svg'),
                        SvgPicture.asset('assets/google.svg'),
                        SvgPicture.asset('assets/twitter.svg'),
                      ],
                      alignment: MainAxisAlignment.center,
                    ).wFull(context),
                    16.heightBox,
                    Row(
                      children: [
                        Container(
                          child: Text("Don't have an account? ",
                              style: TextStyle(color: Colors.white)),
                        ),
                        InkWell(
                            child: Text(
                              'Sign Up here!',
                              style: TextStyle(color: Coolors.orangish),
                            ),
                            onTap: () {
                              Get.toNamed(Routes.REGISTER);
                            }),
                      ],
                    )
                  ],
                  alignment: MainAxisAlignment.center,
                  crossAlignment: CrossAxisAlignment.center,
                ),
                bottom: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
