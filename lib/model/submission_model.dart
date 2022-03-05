import 'package:apphainguyen/model/form_model.dart';
import 'package:apphainguyen/model/status_model.dart';
import 'package:apphainguyen/model/user_model.dart';

class SubmissionModel {
  int id;
  String updateAt;
  StatusModel statusModel;
  FormModel formModel;
  UserModel userModel;

  SubmissionModel({
    // required this.updateAt,
    required this.id,
    required this.updateAt,
    required this.statusModel,
    required this.formModel,
    required this.userModel,
  });

  factory SubmissionModel.fromJson(Map<String, dynamic> json) {
    return SubmissionModel(
      // updateAt: json['updated_at'] as String,
      id: json['id'] as int,
      updateAt: json['updated_at'] as String,
      statusModel: StatusModel.fromJson(json['status']),
      formModel:  FormModel.fromJson(json['form']),
      userModel:  UserModel.fromJson(json['all_user']),
    );
  }

  String formatDatetime(){
    String dateString = updateAt;
    DateTime date = DateTime.parse(dateString);
    DateTime newDate = DateTime(date.year,date.month,date.day,date.hour,date.minute);
    return newDate.toString().substring(0,16);
  }
}
