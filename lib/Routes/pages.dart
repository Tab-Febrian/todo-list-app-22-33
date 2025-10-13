import 'package:get/get.dart';
import 'package:todo_list_app/Bindings/auth_binding.dart';
import 'package:todo_list_app/Bindings/nav_binding.dart';
import 'package:todo_list_app/Bindings/splashscreen_bindings.dart';
import 'package:todo_list_app/Bindings/todo_binding.dart';
import 'package:todo_list_app/Model/todo_model.dart';
import 'package:todo_list_app/Pages/add_todo_screen.dart';
import 'package:todo_list_app/Pages/edit_todo_screen.dart';
import 'package:todo_list_app/Pages/history_screen.dart';
import 'package:todo_list_app/Pages/login_screen.dart';
import 'package:todo_list_app/Pages/nav_page.dart';
import 'package:todo_list_app/Pages/profile_screen.dart';
import 'package:todo_list_app/Pages/splashscreen_page.dart';
import 'package:todo_list_app/Pages/todo_screen.dart';
import 'package:todo_list_app/Routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: AppRoutes.nav, page: () => NavPage(), binding: NavBinding()),
    GetPage(
      name: AppRoutes.todo,
      page: () => TodoScreen(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => HistoryScreen(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.todoAdd,
      page: () => AddTodoScreen(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashcreenBindings(),
    ),
    GetPage(
      name: AppRoutes.todoEdit,
      page: () => EditTodoScreen(todo: Get.arguments as Todo),
      binding: TodoBinding(),
    ),
  ];
}
