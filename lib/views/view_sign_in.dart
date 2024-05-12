import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palala/viewmodels/viewmodels_auth.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final AuthUser authUser = Get.put(AuthUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.JPG',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 320,
            height: 422,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 233, 227),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Your Account',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: authUser.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF5E8A75),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF5E8A75), width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.email_rounded),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: authUser.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF5E8A75),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF5E8A75), width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock_sharp),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        authUser.signIn();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5E8A75),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text(
                //       'Sign in with',
                //       style: TextStyle(fontSize: 16, color: Colors.black),
                //     ),
                //     const SizedBox(width: 10),
                //     IconButton(
                //       onPressed: () {},
                //       icon: SvgPicture.asset(
                //         'assets/svg/icon-google.svg',
                //         width: 20,
                //         height: 20,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/sign-up');
                      },
                      child: Text(
                        'Sign up now',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
