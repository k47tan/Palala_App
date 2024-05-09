// buatkan widget navbar
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodels/viewmodels_auth.dart';

class Navbar extends StatelessWidget {
  Navbar({Key? key});
  final AuthUser authUser = Get.find<AuthUser>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
              color: Colors.grey), // warna ikon ketika tidak dipilih
          activeIcon: Icon(Icons.home,
              color: Color(0xFF5E8A75)), // warna ikon ketika dipilih
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_sunny_rounded, color: Colors.grey),
          activeIcon: Icon(Icons.wb_sunny_rounded, color: Color(0xFF5E8A75)),
          label: 'Weather',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: Colors.grey),
          activeIcon: Icon(Icons.chat, color: Color(0xFF5E8A75)),
          label: 'Chat Bot',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout, color: Colors.grey),
          activeIcon: Icon(Icons.logout, color: Color(0xFF5E8A75)),
          label: 'Logout',
        )
      ],
      currentIndex: 0,
      onTap: (int index) {
        if (index == 0) {
          Get.offNamed('/home');
        } else if (index == 1) {
          Get.offNamed('/weather');
        } else if (index == 2) {
          Get.offNamed('/chat-bot');
        } else if (index == 3) {
          authUser.signOut();
        }
      },
    );
  }
}
