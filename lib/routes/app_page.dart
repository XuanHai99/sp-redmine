import 'package:apphainguyen/page/dashboard/binding/dashboard_binding.dart';
import 'package:apphainguyen/page/dashboard/presentation/dashboard.dart';
import 'package:apphainguyen/page/login/binding/login_binding.dart';
import 'package:apphainguyen/page/login/presentation/login.dart';
import 'package:get/get.dart';

part 'app_route.dart';

class AppPage{
  static const initial = Routes.login;
  static final routes = [
    GetPage(
        name: Routes.login,
        page:()=> Login(),
        binding:LoginBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page:()=> Dashboard(),
      binding:DashboardBinding(),
    ),
  ];
}