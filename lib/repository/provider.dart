import 'dart:convert';
import 'package:apphainguyen/model/response_model.dart';
import 'package:get/get.dart';

Map<String, String> HEADERS = {
  'Content-Type': 'application/json; charset=UTF-8',
};

class AppProvider extends GetConnect{
  Future<ResponseModel> getMethod({required String path}) async {
    Response response = await get(path, headers: HEADERS);
    updateCookie(response);
    if (response.statusCode == 200) { 
      return ResponseModel.fromJson(response.body);
    } else {
      throw Exception('Error');
    }
  }

  Future<ResponseModel> postMethod({required String path, required dynamic body}) async {
    Response response = await post(
      path,
      body,
      headers: HEADERS,
    );
    updateCookie(response);
    ResponseModel responseModel = ResponseModel.fromJson(response.body);
    if (responseModel.code == 200) {
      return responseModel;
    } else {
      throw Exception('Error');
    }
  }

  void updateCookie(Response response) {
    String? rawCookie = response.headers!['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      HEADERS['cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
//
// class AppProvider extends GetConnect {
//
//   Future<ResponseModel> getMethod({required String path}) async {
//     Response response = await get(path, headers: headers);
//     updateCookie(response);
//     if (response.statusCode == 200) {
//       return ResponseModel.fromJson(response.body);
//     } else {
//       throw Exception('Loi ne du me');
//     }
//   }
//
//   Future<ResponseModel> postMethod({required String path,required dynamic body}) async {
//     Response response = await post(path, body, headers: headers);
//     updateCookie(response);
//     //ResponseModel data = ResponseModel.fromJson(jsonDecode(response.bodyString ?? ''));
//
//     if (response.statusCode == 200) {
//       return ResponseModel.fromJson(response.body);
//     } else {
//       throw Exception('Loi ne du me');
//     }
//   }
//
//   static updateCookie(Response response) {
//     String? rawCookie = response.headers!['set-cookie'];
//     if (rawCookie != null) {
//       int index = rawCookie.indexOf(';');
//       headers['cookie'] = (index == -1) ? rawCookie : rawCookie.substring(0, index);
//     }
//   }
// }

// class AppProvider {
//   static Future<ResponseModel> getMethod({required String path}) async {
//     http.Response response = await http.get(Uri.parse(path), headers: headers);
//     updateCookie(response);
//     if (response.statusCode == 200) {
//       return ResponseModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Error');
//     }
//   }
//
//   static Future<ResponseModel> postMethod({required String path, required dynamic body}) async {
//     http.Response response = await http.post(
//       Uri.parse(path),
//       body: body,
//       headers: headers,
//     );
//     updateCookie(response);
//     if (response.statusCode == 200) {
//       return ResponseModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Error');
//     }
//   }
//
//   static void updateCookie(http.Response response) {
//     String? rawCookie = response.headers['set-cookie'];
//     if (rawCookie != null) {
//       int index = rawCookie.indexOf(';');
//       headers['cookie'] =
//       (index == -1) ? rawCookie : rawCookie.substring(0, index);
//     }
//   }
//
// }