import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/api/const_api.dart';
import '../../model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<NewsFetched?> fetchNews() async {
    try {
      emit(NewsLoading());
      var response = await Dio().get(ApiInformation.apiLinkTR);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data["articles"];
        if (data is List) {
          emit(NewsFetched(data.map((e) => Articles.fromJson(e)).toList()));
          return NewsFetched(data.map((e) => Articles.fromJson(e)).toList());
        }
      }
      emit(NewsLoading());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
