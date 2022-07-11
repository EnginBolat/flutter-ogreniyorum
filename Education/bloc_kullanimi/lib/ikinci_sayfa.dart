import 'package:bloc_kullanimi/sabitler.dart';
import 'package:bloc_kullanimi/sayac_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class IkinciSayfa extends StatelessWidget {
  IkinciSayfa({Key? key}) : super(key: key);

  Texts text = Texts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text.appBarText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SayacCubit, int>(builder: (context, sayacDegeri) {
              return Text(
                "$sayacDegeri",
                style: const TextStyle(fontSize: 32),
              );
            }),
            ElevatedButton(
              onPressed: () {
                // print("Arttır");
                context.read<SayacCubit>().sayacArttir();
              },
              child: Text(text.arttir),
            ),
            ElevatedButton(
              onPressed: () {
                // print("Azalt");
                context.read<SayacCubit>().sayacAzalt(1);
              },
              child: Text(text.azalt),
            ),
          ],
        ),
      ),
    );
  }
}
