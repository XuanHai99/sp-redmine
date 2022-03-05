import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusModel {
  int max;
  int min;
  int totalConfirm;
  int totalNotConfirm;

  StatusModel(
      {required this.max,
      required this.min,
      required this.totalConfirm,
      required this.totalNotConfirm});

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      max: json['max'] as int,
      min: json['min'] as int,
      totalConfirm: json['totalConfirm'] as int,
      totalNotConfirm: (json['totalNOtConfirm'] != null)
          ? json['totalNOtConfirm'] as int
          : 0,
    );
  }

  Color getStatus() {
    if (max == 1) {
      if (min == 0) {
        if (totalNotConfirm == 1)
          return Colors.blue;
        else {
          return Colors.green;
        }
      } else {
        return Colors.orange;
      }
    }
    return Colors.grey;
  }
}
