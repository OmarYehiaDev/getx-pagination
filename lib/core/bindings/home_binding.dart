import 'package:get/get.dart';

import '../controllers/home_ctrl.dart';
import '../repository/repository.dart';
class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository(Get.find()));
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
