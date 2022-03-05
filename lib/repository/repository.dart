import 'dart:convert';

import 'package:apphainguyen/model/confirmation_model.dart';
import 'package:apphainguyen/model/dropdown_form_model.dart';
import 'package:apphainguyen/model/response_model.dart';
import 'package:apphainguyen/model/submission_model.dart';
import 'package:apphainguyen/repository/provider.dart';
import 'package:http/http.dart' as http;

// Map<String, String> HEADERS = {
//   'Content-Type': 'application/json; charset=UTF-8',
// };

class AppRepository {
  // static Future<ResponseModel> getMethod({required String path}) async {
  //   http.Response response = await http.get(Uri.parse(path), headers: HEADERS);
  //   updateCookie(response);
  //   if (response.statusCode == 200) {
  //     return ResponseModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Error');
  //   }
  // }
  //
  // static Future<ResponseModel> postMethod({required String path, required dynamic body}) async {
  //   http.Response response = await http.post(
  //     Uri.parse(path),
  //     body: body,
  //     headers: HEADERS,
  //   );
  //   updateCookie(response);
  //   if (response.statusCode == 200) {
  //     return ResponseModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Error');
  //   }
  // }
  //
  // static void updateCookie(http.Response response) {
  //   String? rawCookie = response.headers['set-cookie'];
  //   if (rawCookie != null) {
  //     int index = rawCookie.indexOf(';');
  //     HEADERS['cookie'] =
  //     (index == -1) ? rawCookie : rawCookie.substring(0, index);
  //   }
  // }

  Future<bool> postLogin(
      {required String userMail, required String userPassword}) async {
    var body = {
      "user_mail": userMail,
      "user_password": userPassword,
    };
    return AppProvider().postMethod(path: 'http://10.0.2.2:8000/api/users/login', body: jsonEncode(body))
        .then((response) {
      if (response.code == 200)
        return true;
      else
        return false;
    });
  }

  Future<ResponseModel> getIndex() async {
    return AppProvider().getMethod(path: 'http://10.0.2.2:8000/api/users/index');
  }

  Future<ResponseModel> getAllResult() async {
    var body = {
      "applicant": "",
      "post_id": null,
      "model_id": null,
      "from_date": "",
      "to_date": "",
      "key_word": ""
    };
    return AppProvider().postMethod(path: 'http://10.0.2.2:8000/api/users/history', body: jsonEncode(body));
  }

  Future<List<ConfirmationModel>> getSearchResult({
    required  applicant,
    required  postId,
    required  modelId,
    required  fromDate,
    required  toDate,
    required  keyWork,
  }) async {
    var body = {
      "applicant": applicant,
      "post_id": postId,
      "model_id": modelId,
      "from_date": fromDate,
      "to_date": toDate,
      "key_word": keyWork
    };
    return AppProvider().postMethod(path: 'http://10.0.2.2:8000/api/users/history', body: jsonEncode(body))
        .then((response) {
      return (response.data['confirmations'] as List)
          .map((e) => ConfirmationModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }
}
