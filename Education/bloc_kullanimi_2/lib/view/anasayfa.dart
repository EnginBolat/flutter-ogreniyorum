import 'package:bloc_kullanimi_2/const/text.dart';
import 'package:bloc_kullanimi_2/model/user_model.dart';
import 'package:bloc_kullanimi_2/view/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnaSayfa extends StatelessWidget {
  AnaSayfa({Key? key}) : super(key: key);

  ConstText constText = ConstText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(constText.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserCubit, String>(builder: (context, isim) {
              return Text(
                isim,
                style: const TextStyle(
                  fontSize: 32,
                ),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text(constText.changePage))
          ],
        ),
      ),
    );
  }
}
