import 'package:get/get.dart';
import 'package:t/app/model/model_user.dart';

class AcceuilController extends GetxController {
  var user = User().obs;

  void updateUser(String username, String password, String imagePath) {
    user.update((val) {
      val!.username = username;
      val.password = password;
      val.imagePath = imagePath;
    });
  }

  }


