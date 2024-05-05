import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palala/viewmodels/viewmodels_auth.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final AuthUser _controller = Get.put(AuthUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.JPG',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // login form
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
                  'Sign Up Your Account',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                // form input email
                TextFormField(
                  controller: _controller.emailController,
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
                // form input password
                TextFormField(
                  controller: _controller.passwordController,
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
                // button sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                          Text(
                            'Back to Sign In',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _controller.createUser();
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
