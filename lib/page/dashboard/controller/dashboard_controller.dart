import 'package:get/get.dart';

class DashboardController extends GetxController {
  var _rxTabIndex = 0.obs;

  int get tabIndex => _rxTabIndex.value;

  void changeTabIndex(int index) {
    _rxTabIndex.value = index;
  }
}