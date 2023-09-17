import 'package:flutter/material.dart';

class AuthPageTitle extends StatelessWidget {
  const AuthPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Text(
        'User Login',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
