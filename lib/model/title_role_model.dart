class TitleRoleModel {
  int id;
  String postName;


  TitleRoleModel({required this.id, required this.postName,});

  factory TitleRoleModel.fromJson(Map<String, dynamic> json) {
    return TitleRoleModel(
      id: json['id'] as int,
      postName: json['post_name'] as String,
    );
  }
}
