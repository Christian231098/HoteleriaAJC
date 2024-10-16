import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/user_controller.dart';
import '../Screens/user_from_screen.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Usuarios'),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userController.userList[index].nombre),
                subtitle: Text(userController.userList[index].correo),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    userController.deleteUser(userController.userList[index].id);
                  },
                ),
                onTap: () {
                  Get.to(UserFormScreen(userController.userList[index]));
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(UserFormScreen(null)); // Navega a la pantalla para agregar un usuario
        },
      ),
    );
  }
}
