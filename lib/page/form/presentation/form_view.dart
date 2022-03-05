import 'package:apphainguyen/page/form/controller/form_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FormView extends GetView<FormController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text('Form', style: Get.textTheme.headline1),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Column(
          children: [
            ExpansionTile(
              leading: Icon(Icons.arrow_drop_down),
              title: Text('Category 1',style: Get.textTheme.headline3!.copyWith(color: Colors.white),),
              collapsedBackgroundColor: Colors.green,
              backgroundColor: Colors.green,
              collapsedIconColor: Colors.white,
              collapsedTextColor: Colors.white,
              textColor: Colors.white,
              iconColor: Colors.white,
              children: [
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.dashboard,
                      color: Colors.pink,
                    ),
                    title: Text('Question 1'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              height: 1,
            ),
          ],
        ),
        Column(
          children: [
            ExpansionTile(
              leading: Icon(Icons.arrow_drop_down),
              title: Text('Category 1',style: Get.textTheme.headline3!.copyWith(color: Colors.white),),
              collapsedBackgroundColor: Colors.green,
              backgroundColor: Colors.green,
              collapsedIconColor: Colors.white,
              collapsedTextColor: Colors.white,
              textColor: Colors.white,
              iconColor: Colors.white,
              children: [
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.dashboard,
                      color: Colors.pink,
                    ),
                    title: Text('Question 1'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
              height: 1,
            ),
          ],
        ),
        Column(
          children: [
            ExpansionTile(
              leading: Icon(Icons.arrow_drop_down),
              title: Text('Category 1',style: Get.textTheme.headline3!.copyWith(color: Colors.white),),
              collapsedBackgroundColor: Colors.green,
              backgroundColor: Colors.green,
              collapsedIconColor: Colors.white,
              collapsedTextColor: Colors.white,
              textColor: Colors.white,
              iconColor: Colors.white,
              children: [
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.dashboard,
                      color: Colors.pink,
                    ),
                    title: Text('Question 1'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
              height: 1,
            ),
          ],
        ),
        Column(
          children: [
            ExpansionTile(
              leading: Icon(Icons.arrow_drop_down),
              title: Text('Category 1',style: Get.textTheme.headline3!.copyWith(color: Colors.white),),
              collapsedBackgroundColor: Colors.green,
              backgroundColor: Colors.green,
              collapsedIconColor: Colors.white,
              collapsedTextColor: Colors.white,
              textColor: Colors.white,
              iconColor: Colors.white,
              children: [
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.dashboard,
                      color: Colors.pink,
                    ),
                    title: Text('Question 1'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
              height: 1,
            ),
          ],
        ),
      ],
    );
  }
}
