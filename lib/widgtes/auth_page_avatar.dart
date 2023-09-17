import 'package:flutter/material.dart';

class AuthPageAvatar extends StatelessWidget {
  const AuthPageAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.red.shade50,
          radius: 50,
          child: Icon(
            Icons.person,
            size: 80,
            color: Colors.redAccent.shade200,
          ),
        ),
        // welcome back, you've been missed!
        Container(
          padding: const EdgeInsets.only(top: 32),
          child: Text(
            'Welcome back you\'ve been missed!',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
