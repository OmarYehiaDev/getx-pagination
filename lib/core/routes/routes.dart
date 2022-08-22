import 'package:get/get.dart';

import '../../views/screens/home_screen.dart';
import '../bindings/home_binding.dart';

final List<GetPage> routes = [
  GetPage(
    name: '/',
    page: () => HomeScreen(Get.find()),
    binding: HomeBindings(),
  ),
];
