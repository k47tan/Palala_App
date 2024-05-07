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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Welcome to Home'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/admin');
              },
              child: const Text('admin'),
            ),
          ],
        ),
      ),
    );
  }
}
