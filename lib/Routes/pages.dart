import 'package:get/get.dart';
import 'package:todo_list_app/Bindings/auth_binding.dart';
import 'package:todo_list_app/Bindings/nav_binding.dart';
import 'package:todo_list_app/Bindings/todo_binding.dart';
import 'package:todo_list_app/Fragments/add_todo_page.dart';
import 'package:todo_list_app/Fragments/history_fragment.dart';
import 'package:todo_list_app/Fragments/profile_fragment.dart';
import 'package:todo_list_app/Fragments/todo_fragment.dart';
import 'package:todo_list_app/Pages/login_page.dart';
import 'package:todo_list_app/Pages/nav_page.dart';
import 'package:todo_list_app/Routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.nav,
      page: () => NavPage(),
      binding: NavBinding(),
    ),
    GetPage(
      name: AppRoutes.todo,
      page: () => const TodoFragment(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryFragment(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileFragment(),
    ),
     GetPage(
      name: AppRoutes.todoAdd,
      page: () => AddTodoPage(),
      binding: TodoBinding(),
    ),
  ];
}
