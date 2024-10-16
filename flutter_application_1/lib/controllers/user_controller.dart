import 'package:get/get.dart';
import '../Models/user.dart';
import '../Services/user_service.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = <User>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await UserService.getUsers();
      userList.assignAll(users);
    } finally {
      isLoading(false);
    }
  }

  void addUser(User user) async {
    try {
      isLoading(true);
      var newUser = await UserService.createUser(user);
      userList.add(newUser);
    } finally {
      isLoading(false);
    }
  }

  void updateUser(User user) async {
    try {
      isLoading(true);
      var updatedUser = await UserService.updateUser(user);
      int index = userList.indexWhere((u) => u.id == user.id);
      if (index != -1) {
        userList[index] = updatedUser;
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteUser(int id) async {
    try {
      isLoading(true);
      await UserService.deleteUser(id);
      userList.removeWhere((u) => u.id == id);
    } finally {
      isLoading(false);
    }
  }
}
