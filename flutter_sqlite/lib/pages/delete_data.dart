import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({Key? key}) : super(key: key);

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Data'),
      ),
      // body: ,
    );
  }
}
