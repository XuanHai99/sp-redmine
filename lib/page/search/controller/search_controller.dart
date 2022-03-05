import 'package:apphainguyen/model/confirmation_model.dart';
import 'package:apphainguyen/model/dropdown_form_model.dart';
import 'package:apphainguyen/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxInt rxChooseValue = 0.obs;

  int get chooseValue => rxChooseValue.value;

  RxString rxStringDateStart = ''.obs;

  String get stringDateStart => rxStringDateStart.value;

  RxString rxStringDateEnd = ''.obs;

  String get stringDateEnd => rxStringDateEnd.value;

  RxBool rxDateError = false.obs;

  bool get dateError => rxDateError.value;

  TextEditingController nameController = TextEditingController();
  TextEditingController postIdController = TextEditingController();
  TextEditingController keyWorkController = TextEditingController();

  List<DropdownFormModel> dropdownList = [];
  List<ConfirmationModel> allResult = <ConfirmationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // fetchDropdownList();
    fetchAllResult();
  }

  chooseDropdown(dynamic value) {
    rxChooseValue.value = value;
  }

  chooseDateStart(DateTime value) {
    rxStringDateStart.value = value.toString();
  }

  chooseDateEnd(DateTime value) {
    rxStringDateEnd.value = value.toString();
  }

  bool checkDate() {
    rxDateError.value = false;
    if (stringDateStart == '' && stringDateEnd == '')
      return true;
    else {
      if ((stringDateStart == '' && stringDateEnd != '') ||
          (stringDateStart != '' && stringDateEnd == '')) {
        rxDateError.value = true;
        return false;
      } else {
        if (DateTime.parse(stringDateStart)
            .isAfter(DateTime.parse(stringDateEnd))) {
          rxDateError.value = true;
          return false;
        }
      }
    }
    return true;
  }

  closeMessage() {
    rxDateError.value = false;
  }

  // fetchDropdownList()async{
  //   dropdownList = await AppRepository().getFindListIdSearch();
  // }

  fetchAllResult() {
    AppRepository().getAllResult().then((response) {
      if (response.code == 200) {
        /// List Confirmation History
        List<ConfirmationModel> _listHistory =
            (response.data['confirmations'] as List)
                .map((model) =>
                    ConfirmationModel.fromJson(model as Map<String, dynamic>))
                .toList();
        allResult.addAll(_listHistory);

        /// List Form
        List<DropdownFormModel> _listForm = (response.data['forms'] as List)
            .map((model) =>
                DropdownFormModel.fromJson(model as Map<String, dynamic>))
            .toList();
        dropdownList.addAll(_listForm);
        DropdownFormModel allValue = DropdownFormModel(id: 0, modelName: 'All');
        dropdownList.insert(0,allValue);
      }
    });
  }

  search() {
    if (checkDate()) {
      allResult.clear();
      AppRepository()
          .getSearchResult(
              applicant: nameController.text,
              postId: (postIdController.text=='')? null : int.parse(postIdController.text),
              modelId: (rxChooseValue.value==0) ? null : rxChooseValue.value,
              fromDate: stringDateStart,
              toDate: stringDateEnd,
              keyWork: keyWorkController.text)
          .then((list) {
        allResult.addAll(list);
      });
    }
  }
}
