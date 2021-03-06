import 'package:flutter/material.dart';
import 'package:login_register_screen/widgets/button_design.dart';
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
      elevation: 0.0,
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
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  title: const Text("Logout?"),
                  backgroundColor: Theme.of(context).primaryColor,
                  content: const Text(
                    "Are You Sure?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text(
                        "Okay",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()));
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        )
      ],
      elevation: 0.0,
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
      elevation: 0.0,
    );
  }
}
