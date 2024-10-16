import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/user.dart';
import '../Controllers/user_controller.dart';

class UserFormScreen extends StatelessWidget {
  final UserController userController = Get.find();
  final User? user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  UserFormScreen(this.user, {Key? key}) : super(key: key) {
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
              onPressed: () {
                if (user == null) {
                  // Agregar usuario
                  final newUser = User(
                    id: DateTime.now().millisecondsSinceEpoch, // Genera un ID temporal
                    nombre: nameController.text,
                    correo: emailController.text,
                  );
                  userController.addUser(newUser);
                } else {
                  // Actualizar usuario
                  user!.nombre = nameController.text;
                  user!.correo = emailController.text;
                  userController.updateUser(user!);
                }
                Get.back(); // Cierra la pantalla
              },
              child: Text(user == null ? 'Agregar' : 'Actualizar'),
            )
          ],
        ),
      ),
    );
  }
}
