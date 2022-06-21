import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:login_register_screen/widgets/favorite_contacts.dart';

import '../widgets/appbar_design.dart';
import '../widgets/clipper_design.dart';
import '../widgets/newpost_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, User}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

bool isLiked = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarHomePage(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  child: ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://wallpaper.dog/large/966733.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: double.infinity,
                      height: 300.0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 12,
                  top: 230,
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/engin.jpg"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
                  child: Text(
                    "ENGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blueGrey,
                      letterSpacing: 1.3,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const FavoriteContacts(),
            const NewPost(),
          ],
        ),
      ),
    );
  }
}
