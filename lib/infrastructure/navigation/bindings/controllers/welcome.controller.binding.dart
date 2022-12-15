import 'package:get/get.dart';

import '../../../../presentation/home/controllers/welcome.controller.dart';

class WelcomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
  }
}
