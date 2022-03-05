import 'package:apphainguyen/page/dashboard/controller/dashboard_controller.dart';
import 'package:apphainguyen/page/form/controller/form_controller.dart';
import 'package:apphainguyen/page/home/controller/home_controller.dart';
import 'package:apphainguyen/page/search/controller/search_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(SearchController());
    Get.put(FormController());
  }
}