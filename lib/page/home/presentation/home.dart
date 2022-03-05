import 'package:apphainguyen/model/submission_model.dart';
import 'package:apphainguyen/page/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Application',style: Get.textTheme.headline2,),
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.orange,
            indicatorWeight: 6,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(child: Container(width: 120,child: Center(child: Text('Tab 1',style: Get.textTheme.headline4,)))),
              Tab(child: Container(width: 120,child: Center(child: Text('Tab 2',style: Get.textTheme.headline4,)))),
            ],
          ),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return TabBarView(children: [
      Obx(()=>buildTab1()),
      Obx(()=>buildTab2()),
    ]);
  }

  Widget buildTab1(){
    return ListView.builder(
      itemCount: controller.listSubmitting.length,
      itemBuilder: (context,index)=> _item(controller.listSubmitting[index]),
    );
  }

  Widget buildTab2(){
    return ListView.builder(
      itemCount: controller.listAll.length,
      itemBuilder: (context,index)=> _item(controller.listAll[index]),
    );
  }

  Widget _item(SubmissionModel submissionModel){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 16,right: 16,top: 12,bottom: 12),
          height: 96,
          color: Colors.white,
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.adb,size: 48,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Icon(Icons.home,color: Colors.blue,),
                    Container(
                      width: Get.width-160,
                      child: Text(submissionModel.formModel.modelName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Get.textTheme.headline2,),
                    ),
                  ],),
                  SizedBox(height: 8),
                  Container(
                    width: Get.width-160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(submissionModel.formatDatetime(),style: Get.textTheme.subtitle1!.copyWith(fontSize: 16,color: Colors.black54),),
                        Text(submissionModel.userModel.userName,style: Get.textTheme.subtitle1!.copyWith(fontSize: 16,color: Colors.black54),),

                      ],
                    ),
                  ),
                ],
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ),
        Divider(thickness: 1),
      ],
    );
  }
}
