import 'package:bloc_kullanimi_2/const/text.dart';
import 'package:bloc_kullanimi_2/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  ConstText constText = ConstText();
  var isimController = TextEditingController();

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
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextField(
                decoration: const InputDecoration(hintText: "İsim"),
                controller: isimController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<UserCubit>().isimDegistir(isimController.text);
                },
                child: Text(constText.change))
          ],
        ),
      ),
    );
  }
}
