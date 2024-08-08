//
// @Author: "Eldor Turgunov"
// @Date: 08.08.2024
// @File name: message
//

import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Center(
        child:ElevatedButton(
          onPressed: () {
            // Logic to send a message goes here
            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => MessageDetailScreen()));
          },
          child: Text('Send Message'),
        ),
      ),
    );
  }
}
