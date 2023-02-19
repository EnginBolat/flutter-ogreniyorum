import 'package:flutter/material.dart';

import 'multi_thread_view_model.dart';

class MultiThreadView extends MultiThreadViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$count"),
      ),
      body: Center(
        child: isLoading ? CircularProgressIndicator() : SizedBox(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeLoading,
      ),
    );
  }
}
