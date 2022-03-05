import 'package:apphainguyen/page/dashboard/controller/dashboard_controller.dart';
import 'package:apphainguyen/page/form/presentation/form_view.dart';
import 'package:apphainguyen/page/home/presentation/home.dart';
import 'package:apphainguyen/page/search/presentation/search.dart';
import 'package:apphainguyen/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            Home(),
            Container(),
            FormView(),
            Search(),
            Container(
              child: Center(
                child: TextButton(
                  child: Text('Logout'),
                  onPressed: () async {
                    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    sharedPreferences.remove("email");
                    sharedPreferences.remove("password");
                    Get.offAllNamed(Routes.login);
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.redAccent,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: Icons.new_releases_sharp,
              label: 'News',
            ),
            _bottomNavigationBarItem(
              icon: Icons.accessibility_new,
              label: 'Ability',
            ),
            _bottomNavigationBarItem(
              icon: Icons.search,
              label: 'Search',
            ),
            _bottomNavigationBarItem(
              icon: Icons.person,
              label: 'Account',
            ),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}