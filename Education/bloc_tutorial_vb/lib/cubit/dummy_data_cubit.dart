import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial_vb/model/dummy_data_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'dummy_data_state.dart';

class DummyDataCubit extends Cubit<DummyDataState> {
  DummyDataCubit() : super(DummyDataInitial());

  Future<List<DummyData>> getData() async {
    emit(DummyDataIsLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    final Uri baseUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(baseUrl);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body) as List;
        emit(DummyDataLoaded(
            jsonBody.map((e) => DummyData.fromJson(e)).toList()));
        return jsonBody.map((e) => DummyData.fromJson(e)).toList();
      default:
        throw NetworkError(response.statusCode.toString(), response.body);
    }
  }

  void navigateErrorPage() {
    emit(DummyDataError("Error Page"));
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}
