import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelmesaj;
  final Function komut;
  final TextEditingController kontrol;

  // ignore: use_key_in_widget_constructors
  const CustomTextField({required this.labelmesaj,required this.kontrol,required this.komut});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(
          labelmesaj,
          style: const TextStyle(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      controller: kontrol,
      onSubmitted: (_)=>{},
    );
  }
}
