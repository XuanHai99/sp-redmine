class ResponseModel {
  final int code;
  final String status;
  final String message;
  final data;
  final error;

  ResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
    required this.error,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'],
      error: json['error'],
    );
  }
}