import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

int _currentTab = 0;

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      selectedItemColor: Colors.white,
      currentIndex: _currentTab,
      onTap: (int value) {
        setState(() {
          _currentTab = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            size: 30,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.exit_to_app,
            size: 30,
          ),
          label: "",
        ),
      ],
    );
  }
}
