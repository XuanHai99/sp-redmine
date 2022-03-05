class DropdownFormModel {
  int id;
  String modelName;

  DropdownFormModel({required this.id, required this.modelName});

  factory DropdownFormModel.fromJson(Map<String, dynamic> json) {
    return DropdownFormModel(
      id: json['id'],
      modelName: json['model_name'],
    );
  }
}
