import 'package:firebase_bloc_login/view/home_page.dart';
import 'package:firebase_bloc_login/view/profile_page.dart';
import 'package:flutter/material.dart';

import '../core/service/firebase_service/firebase_notification_service.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  late final FirebaseNotificationService _notificationService;
  List pages = [HomePage(), HomePage(), HomePage(), ProfilePage()];
  int selectedIndex = 0;

  @override
  void initState() {
    _notificationService = FirebaseNotificationService();
    _notificationService.connectNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_sharp),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
