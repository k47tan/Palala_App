import 'package:get/get.dart';
import 'package:palala/views/view_weather.dart';

import '../views/admin/list_admin.dart';
import '../views/admin/add_place_admin.dart';
import '../views/view_chat.dart';
import '../views/view_home.dart';
import '../views/view_sign_up.dart';
import '../views/view_sign_in.dart';

class AppRoute {
  static final route = [
    GetPage(name: '/sign-in', page: () => SignInView()),
    GetPage(name: '/sign-up', page: () => SignUpView()),
    GetPage(name: '/home', page: () => HomeView()),
    GetPage(name: '/admin-add', page: () => AdminAddView()),
    GetPage(name: '/admin-home', page: () => AdminHomeView()),
    GetPage(name: '/chat-bot', page: () => ChatBotView()),
    GetPage(name: '/weather', page: () => WeatherView()),
  ];
}
