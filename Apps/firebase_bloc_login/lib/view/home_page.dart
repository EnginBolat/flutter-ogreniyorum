import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_login/constants/app_padding.dart';
import 'package:firebase_bloc_login/core/service/firebase_service/firebase_notification_service.dart';
import 'package:firebase_bloc_login/model/person_model.dart';
import 'package:firebase_bloc_login/view/message_list_page.dart';
import 'package:firebase_bloc_login/view/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/in_app/cubit/in_app_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Person? currentUser = Person();
  String? name;
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InAppCubit()
        ..getCurrentUserInfoCubit(FirebaseAuth.instance.currentUser),
      child: BlocConsumer<InAppCubit, InAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CurrentUserInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurrentUserInfo) {
            currentUser = state.currentUser;
            name = currentUser?.name;
            return Scaffold(
              appBar: _buildAppBar(),
              body: Center(
                child: Column(
                  children: [
                    Text(currentUser?.name ?? "BOŞ AD"),
                    Text(currentUser?.surname ?? "BOŞ SOYAD"),
                    Text(currentUser?.email ?? "BOŞ EMAIL"),
                    Text(currentUser?.phone ?? "BOŞ PHONE"),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/share-photo");
                },
                child: const Icon(Icons.add, color: Colors.white),
              ),
            );
          } else {
            return Center(
              child:
                  Text(FirebaseAuth.instance.currentUser?.uid.toString() ?? ""),
            );
          }
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Padding(
        padding: EdgeInsets.only(left: AppPadding.normalValue),
        child: CircleAvatar(
          backgroundColor: Colors.grey[500],
          child: Text(
            (currentUser?.name ?? "").substring(0, 1).toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_active_rounded,
            color: Colors.grey[500],
          ),
        ),
        IconButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => SettingsPage(context: context)));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MessageListPage(
                  userName: name ?? "null",
                ),
              ),
            );
          },
          icon: Icon(
            Icons.message,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
