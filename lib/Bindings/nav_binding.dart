import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/nav_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(() => NavController());
  }
}
