import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './multi_thread.dart';

abstract class MultiThreadViewModel extends State<MultiThread> {
  bool isLoading = true;
  Future<void> changeLoading() async {
    compute(calculate, null).then((value) {
      count = value;
    });
    changeAll();
    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> changeAll() async {
    await Future.delayed(const Duration(seconds: 1));
    print("object");
  }

  int count = 0;
}

int calculate(int number) {
  int _count = 0;
  for (var i = 0; i < 100000000; i++) {
    _count += i;
  }
  return _count;
}
