import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import './../controllers/user_controller.dart';

class UserFormScreen extends StatelessWidget {
  final UserController userController = Get.find();
  final User? user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  UserFormScreen(this.user, {super.key}) {
    if (user != null) {
      nameController.text = user!.nombre;
      emailController.text = user!.correo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user == null ? 'Agregar Usuario' : 'Editar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(user == null ? 'Agregar' : 'Actualizar'),
            )
          ],
        ),
      ),
    );
  }
}
