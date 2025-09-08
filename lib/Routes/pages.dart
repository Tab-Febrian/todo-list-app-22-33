import 'package:get/get.dart';
import 'package:todo_list_app/Fragments/history_fragment.dart';
import 'package:todo_list_app/Fragments/profile_fragment.dart';
import 'package:todo_list_app/Fragments/todo_fragment.dart';
import 'package:todo_list_app/Routes/routes.dart';
import 'package:todo_list_app/Pages/login_page.dart';
import 'package:todo_list_app/Pages/nav_page.dart';

class AppPages{
  // Array Pages
  static final pages = [
    GetPage(name: AppRoutes.nav, page: () => NavPage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()), 
    GetPage(name: AppRoutes.login, page: () => TodoFragment()), 
    GetPage(name: AppRoutes.login, page: () => HistoryFragment()), 
    GetPage(name: AppRoutes.login, page: () => ProfileFragment()), 
  ];
}