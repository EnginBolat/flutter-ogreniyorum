import 'package:flutter/material.dart';
import '../model/user_info.dart';
import '../pages/personal_page.dart';

// ignore: camel_case_types
class showListView extends StatefulWidget {
  const showListView({Key? key}) : super(key: key);

  @override
  _showListViewState createState() => _showListViewState();
}

// ignore: camel_case_types
class _showListViewState extends State<showListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PersonalPage(profileIndex: index,)));
          },
          onDoubleTap: () {
            // ignore: avoid_print
            print("You Clicked ${users[index].name} twice!");
          },
          onLongPress: () {
            // ignore: avoid_print
            print("${users[index].name}: Please let me go!");
          },
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: CircleAvatar(
                          backgroundImage: AssetImage(users[index].resimUrl),
                          radius: 20),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      users[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
