import 'package:get/get.dart';
import 'package:todo_list_app/Controllers/splashscree_controller.dart';

class SplashcreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut <SplashscreenController>(() => SplashscreenController());
  }
}