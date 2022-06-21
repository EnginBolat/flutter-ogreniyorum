import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

bool isLiked = false;

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                height: 300,
                // color: Colors.red,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://preparatoryblog.files.wordpress.com/2018/07/holiday-2103171_960_720.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onDoubleTap: () {
                setState(
                  () {
                    if (isLiked == false) {
                      isLiked = true;
                    } else if (isLiked == true) {
                      (isLiked = false);
                    }
                  },
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (isLiked == false) {
                        isLiked = true;
                      } else if (isLiked == true) {
                        (isLiked = false);
                      }
                    });
                  },
                  icon: isLiked == false
                      ? const Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.grey,
                        )
                      : const Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.comment,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: const <Widget>[
              Text("Engin ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              SizedBox(
                width: 2,
              ),
              Text("Happy Holidays!",
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
