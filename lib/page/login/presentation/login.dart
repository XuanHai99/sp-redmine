import 'package:apphainguyen/page/login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 48, right: 48),
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                'Hey,\nLogin Now.',
                style: Get.textTheme.headline1!.copyWith(fontSize: 32),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Text('If you are new / ',
                      style: Get.textTheme.subtitle2!
                          .copyWith(fontSize: 20, color: Colors.grey)),
                  TextButton(
                    onPressed: () {},
                    child: Text('Create New',
                        style: Get.textTheme.headline2!
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(height: 48),
              Container(
                padding: EdgeInsets.all(16),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFFf5f5f5),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decorationThickness: 0,
                  ),
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: 'User Email',
                    isCollapsed: true,
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                  },
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFFf5f5f5),
                ),
                child: TextField(
                  obscureText: controller.lookPassword,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decorationThickness: 0,
                  ),
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'User Password',
                    isCollapsed: true,
                    suffixIcon: (!controller.lookPassword)
                        ? GestureDetector(
                            onTap: () => controller.changeLookType(),
                            child: Icon(Icons.security))
                        : GestureDetector(
                            onTap: () => controller.changeLookType(),
                            child: Icon(Icons.remove_red_eye)),
                  ),
                  onChanged: (text) {},
                ),
              ),
              SizedBox(height: 12),
              (controller.errorStatus.isNotEmpty)
                  ?Center(child: Text(controller.errorStatus,style: Get.textTheme.subtitle1!.copyWith(color: Colors.red,fontSize: 16),))
                  :Container(),
              SizedBox(height: 12),
              Row(
                children: [
                  Text('Forget Password / ',
                      style: Get.textTheme.subtitle2!
                          .copyWith(fontSize: 20, color: Colors.grey)),
                  TextButton(
                    onPressed: () {},
                    child: Text('Reset',
                        style: Get.textTheme.headline2!
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: (){
                  controller.login(context);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFb52141),
                  ),
                  child: Center(
                      child: Text(
                    'Login',
                    style: Get.textTheme.headline1!.copyWith(color: Colors.white),
                  )),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip now',
                    style: Get.textTheme.subtitle2!
                        .copyWith(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
