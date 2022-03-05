import 'package:apphainguyen/model/title_role_model.dart';

class UserModel {
  int id;
  String userName;
  TitleRoleModel titleRoleModel;

  UserModel({required this.id, required this.userName,required this.titleRoleModel});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      userName: json['user_name'] as String,
      titleRoleModel: TitleRoleModel.fromJson(json['title_role']),
    );
  }
}
