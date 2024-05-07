import 'package:get/get.dart';

import '../views/admin/home_admin.dart';
import '../views/view_home.dart';
import '../views/view_sign_up.dart';
import '../views/view_sign_in.dart';

class AppRoute {
  static final route = [
    GetPage(name: '/sign-in', page: () => SignInView()),
    GetPage(name: '/sign-up', page: () => SignUpView()),
    GetPage(name: '/home', page: () => HomeView()),
    GetPage(name: '/admin', page: () => AdminView()),
  ];
}
