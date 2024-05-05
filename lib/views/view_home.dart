import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palala/viewmodels/viewmodels_auth.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final AuthUser authUser = Get.find<AuthUser>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                authUser.signOut();
              })
        ],
      ),
      body: const Center(
        child: Text('Welcome to Home'),
      ),
    );
  }
}
