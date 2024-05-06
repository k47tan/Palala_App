import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUser extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // UUID admin
  final String adminUid = 'aJFIxPGq7xOrgiyzMeZOB9PNffN2';

  // fungsi createUser untuk membuat user baru
  void createUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email and password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar(
        'Success',
        'User created successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Membersihkan controller setelah penggunaan
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      await Get.offNamed('/sign-in');
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email and password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = _auth.currentUser;
      // check apakah role admin atau bukan
      if (user!.uid == adminUid) {
        Get.offNamed('/admin');
      } else {
        Get.offNamed('/home');
      }

      Get.snackbar(
        'Success',
        'User signed in successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Membersihkan controller setelah penggunaan
      emailController.clear();
      passwordController.clear();
      // await Get.offNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    await _auth.signOut();
    Get.snackbar(
      'Success',
      'User signed out successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
    await Get.offNamed('/sign-in');
  }

  @override
  void onClose() {
    // Membersihkan controller ketika controller ditutup
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
