import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorText));
  }
}
