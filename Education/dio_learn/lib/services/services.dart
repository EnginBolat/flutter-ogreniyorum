import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:dio_learn/model/comment_model.dart';
import 'package:dio_learn/model/post_model.dart';
import 'package:flutter/foundation.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<List<PostModel>?> fetchPostItems();
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<CommentModel>?> fethSpecificItems(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response =
          await _dio.post(_PostServicePath.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
      return false;
    }
  }

  @override
  Future<List<PostModel>?> fetchPostItems() async {
    try {
      final response = await _dio.get(_PostServicePath.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return null;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response =
          await _dio.post("${_PostServicePath.posts.name}/$id", data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
      return false;
    }
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.post("${_PostServicePath.posts.name}/$id");

      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
      return false;
    }
  }

  @override
  Future<List<CommentModel>?> fethSpecificItems(int postId) async {
    try {
      final response = await _dio.get(_PostServicePath.comments.name,
          queryParameters: {_PostServiceQuery.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error);
    }
    return null;
  }
}

enum _PostServicePath { posts, comments }

enum _PostServiceQuery { postId }

class _ShowDebug {
  static void showDioError(DioError error) {
    if (kDebugMode) {
      print(error.message);
    }
  }
}
