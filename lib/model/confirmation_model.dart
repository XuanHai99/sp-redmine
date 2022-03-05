import 'package:apphainguyen/model/submission_model.dart';

class ConfirmationModel {
  int id;
  SubmissionModel submissionModel;

  ConfirmationModel({required this.id,required this.submissionModel});

  factory ConfirmationModel.fromJson(Map<String, dynamic> json) {
    return ConfirmationModel(
      id: json['id'],
      submissionModel:  SubmissionModel.fromJson(json['submission']),
    );
  }
}
