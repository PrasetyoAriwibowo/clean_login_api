import 'package:clean_login_api/coolors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Coolors.purplish,
            ),
            Container(
              width: context.screenWidth,
              height: context.percentHeight * 75,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  )),
              child: Container(
                margin: EdgeInsets.only(top: 45),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.nameController,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Name",
                          contentPadding: Vx.m2,
                          hintText: "Input your name",
                          prefixIcon: Icon(Icons.people)),
                    ).p16(),
                    TextField(
                      controller: controller.mobileController,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Phone",
                          contentPadding: Vx.m2,
                          hintText: "Input your number phone",
                          prefixIcon: Icon(Icons.local_phone)),
                    ).p16(),
                    TextField(
                      controller: controller.emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Email",
                        contentPadding: Vx.m2,
                        hintText: "Input your email",
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ).p16(),
                    TextField(
                      controller: controller.typeUserController,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Type User",
                          contentPadding: Vx.m2,
                          hintText: "Input your type user",
                          prefixIcon: Icon(Icons.people_outline)),
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
                          ).p16())),
                    ),
                    Container(
                        child: Obx((() => (TextField(
                              controller: controller.confirmPasswordController,
                              autofocus: true,
                              obscureText: controller.isHidePassword1.value,
                              decoration: InputDecoration(
                                  contentPadding: Vx.m2,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: "Password Confirmation",
                                  prefixIcon: Icon(
                                    Icons.lock,
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: (() {
                                        controller.isHidePassword1.value =
                                            !controller.isHidePassword1.value;
                                      }),
                                      icon: controller.isHidePassword1.value
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility))),
                            ).p16())))),
                    ElevatedButton(
                        onPressed: () async {
                          await controller.register();
                        },
                        child: "Register".text.bold.make(),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Coolors.purplish,
                          textStyle: TextStyle(color: Colors.white),
                        )).wh(context.screenWidth, 48).p16()
                  ],
                ),
              ),
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
                ],
                alignment: MainAxisAlignment.center,
                crossAlignment: CrossAxisAlignment.center,
              ),
              bottom: 24,
            ),
          ],
        ),
      ),
    );
  }
}
