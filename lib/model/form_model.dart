class FormModel {
  int id;
  String modelName;
  String image;

  FormModel({
    required this.id,
    required this.modelName,
    required this.image,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      id: json['id'] as int,
      modelName: json['model_name'] as String,
      image: (json['image']!= null) ? json['image'] as String : '',
    );
  }
}
