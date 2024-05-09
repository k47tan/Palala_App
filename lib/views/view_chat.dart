import 'package:flutter/material.dart';

import 'widget/widget_navbar.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 20),
            Text('Welcome to Chat Bot, Comming son',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
