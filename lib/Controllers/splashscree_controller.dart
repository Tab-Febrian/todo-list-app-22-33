import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/Routes/routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }
  checkLogin()async{
    final prefs = await SharedPreferences.getInstance();
    final saveuser = prefs.getString("username");
    await Future.delayed(Duration(seconds: 5));
    if(saveuser !=null){
      Get.offAllNamed(AppRoutes.login);
    }
    else{
      Get.offAllNamed(AppRoutes.login);
    }
  }
}