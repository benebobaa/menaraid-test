import 'package:dio/dio.dart';
import 'package:flutter_menara_id/model/data.dart';

class Api {
  Future<List<Data>> getData() async {
    try {
      var response = await Dio().get('https://reqres.in/api/users?page=2');
      print(response);
      final data = ((response.data['data'] ?? []) as List)
          .map((e) => Data.fromJson(e))
          .toList();
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
