import 'package:flutter/material.dart';
import '../model/user_info.dart';

// ignore: must_be_immutable
class PersonalPage extends StatelessWidget {
  int profileIndex;
  PersonalPage({Key? key, required this.profileIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(users[profileIndex].name.toUpperCase()),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CircleAvatar(
                backgroundImage: AssetImage(users[profileIndex].resimUrl),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              users[profileIndex].name.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              users[profileIndex].dogumTarihi,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              users[profileIndex].tanitimYazisi,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
