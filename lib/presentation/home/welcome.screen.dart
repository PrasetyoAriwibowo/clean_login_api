import 'package:flutter/material.dart';
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
        body: Container(
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
            child: VStack([
              Container(
                height: 250,
                width: context.screenWidth,
                child: SvgPicture.asset('assets/hello.svg'),
              ).pOnly(top: 50, bottom: 32),
              "Welcome . . .".text.center.extraBlack.xl3.makeCentered(),
              8.heightBox,
              "Welcome to my application, click Next or Skip to use more this application"
                  .text
                  .gray500
                  .medium
                  .center
                  .makeCentered()
                  .p16()
            ]),
          ),
          Positioned(
            child: Container(
              height: context.percentHeight * 15,
              child: VStack(
                [
                  HStack(
                    [
                      VxBox().square(5).gray500.roundedFull.make(),
                      10.widthBox,
                      VxBox().square(8).white.roundedFull.make(),
                      10.widthBox,
                      VxBox().square(5).gray500.roundedFull.make(),
                    ],
                    alignment: MainAxisAlignment.center,
                  ).wFull(context),
                  16.heightBox,
                  Spacer(),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.max,
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style:
                            ElevatedButton.styleFrom(primary: Coolors.purplish),
                        onPressed: () {},
                        child: "Skip".text.white.make(),
                      ),
                      [
                        TextButton(
                          style: ElevatedButton.styleFrom(
                              primary: Coolors.purplish),
                          onPressed: () {},
                          child: "Next".text.white.make(),
                        ).px2(),
                        SvgPicture.asset(
                          "assets/next.svg",
                        )
                      ].hStack()
                    ],
                  )
                ],
                alignment: MainAxisAlignment.start,
              ).wFull(context),
            ),
            bottom: 24,
          ),
        ],
      ),
    ));
  }
}
