import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_with_bloc/service/cubit/news_cubit.dart';
import 'package:news_with_bloc/view/home_page.dart';

import 'constants/texts/const_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppName.appName,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white,
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light),
        ),
        home: const HomePage(),
      ),
    );
  }
}
