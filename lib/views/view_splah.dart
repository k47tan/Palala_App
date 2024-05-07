import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palala/viewmodels/viewmodels_auth.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});

  final AuthUser authUser = Get.put(AuthUser());

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToSignIn();
  }

  void navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed('/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background.JPG',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.JPG',
              width: 500,
              height: 500,
            ),
            const CircularProgressIndicator(
              color: Color(0xFF5E8A75),
            ),
          ],
        ),
      ),
    );
  }
}
