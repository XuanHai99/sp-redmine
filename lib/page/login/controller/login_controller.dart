import 'dart:async';
import 'package:apphainguyen/repository/repository.dart';
import 'package:apphainguyen/routes/app_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool rxLookPassword = true.obs;

  bool get lookPassword => rxLookPassword.value;

  RxString rxErrorStatus = ''.obs;

  String get errorStatus => rxErrorStatus.value;

  changeLookType() {
    rxLookPassword.value = !rxLookPassword.value;
  }

  bool verify() {
    resetState();
    bool result = true;
    if (emailController.text.contains('@') &&
        emailController.text.contains('.')) {
      result = true;
      if (passwordController.text.length < 6) {
        result = false;
        rxErrorStatus.value = 'Password min 6 characters';
      }
    } else {
      result = false;
      rxErrorStatus.value = 'Email must contain @ and .';
    }
    return result;
  }

  resetState() {
    rxErrorStatus.value = '';
  }

  login(BuildContext context) {
    if (verify()) {
      AppRepository()
          .postLogin(
              userMail: emailController.text,
              userPassword: passwordController.text)
          .then((value) {
        if (value){
          sharedPreferences();
          Get.toNamed(Routes.dashboard);
        }
        else
          _showDialog(context);
      });
    }
  }

  sharedPreferences()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('email', emailController.text);
    sharedPreferences.setString('password', passwordController.text);
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Error!',
              style: Get.textTheme.headline3,
            )),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Center(
                      child: Text(
                    'Email or password is not correct!',
                    style: Get.textTheme.headline4!
                        .copyWith(fontWeight: FontWeight.normal),
                  )),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          );
        });
  }
}
