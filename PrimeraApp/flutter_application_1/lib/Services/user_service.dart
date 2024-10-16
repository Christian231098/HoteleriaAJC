import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/user.dart';

// Clase para manejar las solicitudes HTTP relacionadas con el modelo User
class UserService {
  static const String baseUrl = 'http://10.40.8.39:8080/api/usuarios';

  // Método para obtener todos los usuarios@
  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users = body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }

  // Método para crear un nuevo usuario
  static Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear usuario');
    }
  }

  // Método para actualizar un usuario existente
  static Future<User> updateUser(User user) async {
    final response = await http.put( // Cambia a http.put
      Uri.parse('$baseUrl/${user.id}'), // Asegúrate de incluir el ID en la URL
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) { // Cambia el código de 201 a 200
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al actualizar usuario');
    }
  }

  // Método para eliminar un usuario
  static Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Error al eliminar usuario');
    }
  }
}
