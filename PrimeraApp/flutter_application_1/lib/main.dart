import 'package:flutter/material.dart';
import '../Screens/home_screen.dart';
import 'package:get/get.dart';
import '../Controllers/user_controller.dart';

void main() {
  // Registra el UserController antes de que inicie la app
  Get.put(UserController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CRUD Usuario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(), // Llama a la pantalla inicial
    );
  }
}
