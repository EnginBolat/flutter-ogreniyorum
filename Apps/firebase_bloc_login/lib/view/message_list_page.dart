import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              if (kDebugMode) print("New Message");
            },
            icon: const Icon(Icons.add, color: Colors.black),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left, color: Colors.black),
        ),
        title: Text(userName,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(index.toString()),
            ),
          );
        },
      ),
    );
  }
}
