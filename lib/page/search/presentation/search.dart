import 'package:apphainguyen/model/confirmation_model.dart';
import 'package:apphainguyen/page/search/controller/search_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Search extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "申請／承認 履歴",
            style: Get.textTheme.headline2,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.black45,
        ),
        backgroundColor: Colors.white10,
        body: _body(context),
      ),
    );
  }
  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            _buildSearchForm(context),
            _buildResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Get.height * 0.02,
          left: Get.width * 0.05,
          right: Get.width * 0.05),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  '申請者',
                  style: Get.textTheme.headline2!
                      .copyWith(color: Colors.grey, fontSize: 20),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller.nameController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  '所属',
                  style: Get.textTheme.headline2!
                      .copyWith(color: Colors.grey, fontSize: 20),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller.postIdController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  '申請モデル',
                  style: Get.textTheme.headline2!
                      .copyWith(color: Colors.grey, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton(
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    value: controller.chooseValue,
                    onChanged: (value) {
                      controller.chooseDropdown(value);
                    },
                    items: controller.dropdownList.map((e) => DropdownMenuItem(value: e.id,child: Text(e.modelName))).toList(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  '申請日',
                  style: Get.textTheme.headline2!
                      .copyWith(color: Colors.grey, fontSize: 20),
                ),
              ),
              Container(
                width: Get.width * .5,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (controller.stringDateStart == '')
                          ? ''
                          : controller.stringDateStart.substring(0, 10),
                      style: Get.textTheme.subtitle1!.copyWith(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100))
                            .then(
                          (value) {
                            controller.chooseDateStart(value!);
                            print(value);
                          },
                        );
                      },
                      icon: Icon(Icons.date_range),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
              ),
              Container(
                width: Get.width * .5,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (controller.stringDateEnd == '')
                          ? ''
                          : controller.stringDateEnd.substring(0, 10),
                      style: Get.textTheme.subtitle1!.copyWith(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100))
                            .then(
                          (value) {
                            controller.chooseDateEnd(value!);
                          },
                        );
                      },
                      icon: Icon(Icons.date_range),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  'フリーワード',
                  style: Get.textTheme.headline2!
                      .copyWith(color: Colors.grey, fontSize: 20),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller.keyWorkController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
              child: Text(
                '検索',
                style: Get.textTheme.headline2!
                    .copyWith(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 72)),
              onPressed: () {
                controller.search();
              }),
          (controller.dateError)
              ? Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: Get.width * .9,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '終了日が開始日より前の日付になっています。\n終了日には開始日以降の日付を指定して下さい。',
                    style:
                    Get.textTheme.subtitle1!.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                      onTap: () => controller.closeMessage(),
                      child: Icon(Icons.close))
                ],
              ))
              : Container(),
        ],
      ),
    );
  }

  Widget _buildResult() {
    return Column(
      children: [
        SizedBox(height: 16),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16),
          height: Get.height*0.072,
          width: Get.width,
          color: Colors.green,
          child: Text('検索結果',style: Get.textTheme.headline2!.copyWith(color: Colors.white,fontSize: 20),),
        ),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: controller.allResult.length,
          itemBuilder: (context,index)=>buildItemSearch(controller.allResult[index]),
        ),
      ],
    );
  }
  Widget buildItemSearch(ConfirmationModel confirmationModel){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          color: Colors.white,
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.adb,size: 48,color: confirmationModel.submissionModel.statusModel.getStatus(),),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                      Icon(Icons.home,color: Colors.grey,),
                      Expanded(
                        child: Container(
                          child: Text(confirmationModel.submissionModel.formModel.modelName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Get.textTheme.headline2!.copyWith(fontSize: 20),),
                        ),
                      ),
                    ],),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(confirmationModel.submissionModel.formatDatetime(),style: Get.textTheme.subtitle1!.copyWith(fontSize: 14,color: Colors.black54),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(confirmationModel.submissionModel.userModel.titleRoleModel.postName,style: Get.textTheme.subtitle1!.copyWith(fontSize: 14,color: Colors.black54),),
                            SizedBox(width: 8),
                            Text(confirmationModel.submissionModel.userModel.userName,style: Get.textTheme.subtitle1!.copyWith(fontSize: 14,color: Colors.black54),),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
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


