import 'dart:io';

import 'package:go_router_learn/constants/app_api.dart';
import 'package:go_router_learn/init/service/i_dio_service.dart';
import 'package:dio/dio.dart';
import 'package:go_router_learn/view/details_page/model/details_page_model.dart';
import 'package:go_router_learn/view/home_page/model/home_page_model.dart';

class DioSercvice implements IDioService {
  @override
  Future<List<HomePageModel>?> fetchPost() async {
    try {
      var response = await Dio().get(AppApi.post);
      if (response.statusCode == HttpStatus.ok) {
        var data = response.data;
        if (data is List) {
          List<HomePageModel>? list =
              data.map((e) => HomePageModel.fromJson(e)).toList();
          return list;
        }
      }
    } catch (e) {
      throw UnimplementedError();
    }
    return null;
  }

  @override
  Future<DetailsPageModel?> fetchDetails(String id) async {
    try {
      var response = await Dio().get(AppApi.details + id);
      if (response.statusCode == HttpStatus.ok) {
        var data = response.data;
        DetailsPageModel item = DetailsPageModel.fromJson(data);
        return item;
      }
      return null;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
