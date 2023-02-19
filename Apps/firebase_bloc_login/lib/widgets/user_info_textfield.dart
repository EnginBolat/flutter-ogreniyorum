import 'package:flutter/material.dart';

import '../constants/app_padding.dart';
import '../constants/app_radius.dart';

class UserInfoTextfield extends StatelessWidget {
  const UserInfoTextfield({
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.obsecureText,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obsecureText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.normalValue),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.normalValue),
          ),
          prefixIcon: icon,
        ),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obsecureText,
      ),
    );
  }
}