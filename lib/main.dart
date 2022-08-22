import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/application_binding.dart';
import 'core/bindings/home_binding.dart';
import 'views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Pagination',
      initialBinding: ApplicationBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(
            Get.find(),
          ),
          binding: HomeBindings(),
        ),
      ],
    );
  }
}
