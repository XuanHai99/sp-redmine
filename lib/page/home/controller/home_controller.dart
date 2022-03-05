import 'package:apphainguyen/model/confirmation_model.dart';
import 'package:apphainguyen/model/submission_model.dart';
import 'package:apphainguyen/repository/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  List<SubmissionModel> listSubmitting = <SubmissionModel>[].obs;
  List<SubmissionModel> listAll = <SubmissionModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  fetchData() async{
     AppRepository().getIndex().then((response){
       if (response.code == 200){
         List<SubmissionModel> _listSubmitting =
         (response.data['accordions']['Author']['Submiting'] as List)
             .map((model) =>
             SubmissionModel.fromJson(model as Map<String, dynamic>))
             .toList();
         listSubmitting.addAll(_listSubmitting);


         List<SubmissionModel> _listApproved =
         (response.data['accordions']['Author']['Approved'] as List)
             .map((model) =>
             SubmissionModel.fromJson(model as Map<String, dynamic>))
             .toList();

         List<SubmissionModel> _listRejected =
         (response.data['accordions']['Author']['Rejected'] as List)
             .map((model) =>
             SubmissionModel.fromJson(model as Map<String, dynamic>))
             .toList();
         listAll.addAll(_listSubmitting);
         listAll.addAll(_listApproved);
         listAll.addAll(_listRejected);
       }
     });
  }
}