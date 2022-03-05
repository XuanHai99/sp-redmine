import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget{
  const SplashView({Key? key}) : super (key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.graphic_eq_outlined,size: 84,),
            Text('My App',style: Get.textTheme.headline1!.copyWith(fontSize: 24,color: Colors.black),)
          ],
        ),
      ),
    );
  }
}