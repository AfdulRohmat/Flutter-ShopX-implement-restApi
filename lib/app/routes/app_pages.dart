import 'package:get/get.dart';

import 'package:flutter_shop_x_implement_rest_api/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_shop_x_implement_rest_api/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
