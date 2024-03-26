import 'package:get/get.dart';

import 'package:team_10_app/bindings/home_binding.dart';
import 'package:team_10_app/pages/home_page.dart';
import 'package:team_10_app/bindings/navbar_binding.dart';
import 'package:team_10_app/navbar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVBAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
  ];
}
