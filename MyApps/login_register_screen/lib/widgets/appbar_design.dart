import 'package:flutter/material.dart';
import '../main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "ToDo",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.red,
      centerTitle: true,
    );
  }
}

class CustomAppBarHomePage extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "ToDo",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.red,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
        )
      ],
    );
  }
}

class CustomAppBarBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "ToDo",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const MyApp()));
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 32,
        ),
      ),
      backgroundColor: Colors.red,
      centerTitle: true,
    );
  }
}
