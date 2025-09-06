import 'package:get/get.dart';
import 'package:todo_list_app/Routes/routes.dart';
import 'package:todo_list_app/Pages/login_page.dart';

class AppPages{
  // Array Pages
  static final pages = [
    // GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()), 
  ];
}