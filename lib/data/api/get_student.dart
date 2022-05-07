import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:smartcardapp/config/app_settings.dart';
import 'package:smartcardapp/data/models/args/http_response.dart';
import 'package:smartcardapp/data/models/student_model.dart';

class StudentServices {
  Future<HttpResponse?> fetchData(String id) async {
    var dio = Dio();
    try {
      var response = await dio.get(AppSettings.baseUrl + "/api/students/$id");

      print(response.data);

      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;

        if (response.data.isEmpty) {
          return const HttpResponse(
            isSuccessful: false,
            message: "يبدو ان هنالك مشكلة في البحث يرجى المحاولة مجدداً",
          );
        } else {
          return HttpResponse(
            isSuccessful: true,
            data: StudentModel.fromJson(map),
          );
        }
      } else {
        return const HttpResponse(
          isSuccessful: false,
          message: "يوجد خطأ ما يرجى التأكد من اتصالك بالانترنيت",
        );
      }
    } catch (e) {
      return HttpResponse(
        isSuccessful: false,
        message: e.toString(),
        responseCode: 400,
      );
    }
  }
}
