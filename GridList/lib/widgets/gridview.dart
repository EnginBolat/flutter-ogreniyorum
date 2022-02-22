import 'package:flutter/material.dart';
import '../model/user_info.dart';
import '../pages/personal_page.dart';

class ShowGridView extends StatefulWidget {
  const ShowGridView({Key? key}) : super(key: key);

  @override
  _ShowGridViewState createState() => _ShowGridViewState();
}

class _ShowGridViewState extends State<ShowGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: users.length,
      itemBuilder: (context,index) {
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
            height: 250,
            width: 200,
            child: Card(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(users[index].resimUrl),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    users[index].name.toUpperCase(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
