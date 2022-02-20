import 'package:flutter/material.dart';

class CustomButtonDesign extends StatelessWidget {
  final String butonBaslik;
  final Function komut;

  // ignore: use_key_in_widget_constructors
  const CustomButtonDesign({required this.butonBaslik,required this.komut});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        child: Text(
          butonBaslik,
          style: Theme.of(context).textTheme.headline6,
        ),
        onPressed: () {
          komut();
        },
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
