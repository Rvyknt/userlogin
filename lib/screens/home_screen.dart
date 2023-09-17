import 'package:flutter/material.dart';
import 'package:userlogin/widgtes/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: CustomAppBar(
          title: 'Homepage',
        ),
      ),
      body: Center(
        child: Text('Homepage'),
      ),
    );
  }
}
